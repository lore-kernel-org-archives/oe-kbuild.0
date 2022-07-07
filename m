Content-Type: multipart/mixed; boundary="===============0273161567722523365=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 61/61] fs/netfs/buffered_write.c:937:2: sparse: sparse: TRIGGER NEW FLUSH GROUP FOR TESTING
Date: Fri, 08 Jul 2022 03:17:09 +0800
Message-ID: <202207080334.HptyaZpn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0273161567722523365==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/netfs/=
buffered_write.c:937:2: sparse: sparse: TRIGGER NEW FLUSH GROUP FOR TESTING"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
linked-list
head:   ce4670495468b797b0c5927fcb661bc0da48b9ab
commit: ce4670495468b797b0c5927fcb661bc0da48b9ab [61/61] netfs: Add a struc=
t to group modifications together and flushed in order
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: nios2-randconfig-s031-20220707 (https://download.01.org/0day-ci/arc=
hive/20220708/202207080334.HptyaZpn-lkp(a)intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/ce4670495468b79=
7b0c5927fcb661bc0da48b9ab
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linke=
d-list
        git checkout ce4670495468b797b0c5927fcb661bc0da48b9ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dn=
ios2 SHELL=3D/bin/bash fs/netfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_write.c:937:2: sparse: sparse: TRIGGER NEW FLUSH GROUP=
 FOR TESTING
   fs/netfs/buffered_write.c:361:28: sparse: sparse: context imbalance in '=
netfs_split_off_front' - unexpected unlock

vim +937 fs/netfs/buffered_write.c

fcf2d3b23ed11b David Howells 2021-06-17  897  =

fcf2d3b23ed11b David Howells 2021-06-17  898  /**
e237ecdc44f74b Jeff Layton   2022-07-01  899   * netfs_file_write_iter_lock=
ed - write data to a file
fcf2d3b23ed11b David Howells 2021-06-17  900   * @iocb:	IO state structure
fcf2d3b23ed11b David Howells 2021-06-17  901   * @from:	iov_iter with data =
to write
fcf2d3b23ed11b David Howells 2021-06-17  902   *
fcf2d3b23ed11b David Howells 2021-06-17  903   * This is a wrapper around _=
_generic_file_write_iter() to be used by most
e237ecdc44f74b Jeff Layton   2022-07-01  904   * filesystems that want to d=
eal with the locking themselves. It takes care
e237ecdc44f74b Jeff Layton   2022-07-01  905   * of syncing the file in cas=
e of O_SYNC.
fcf2d3b23ed11b David Howells 2021-06-17  906   * Return:
fcf2d3b23ed11b David Howells 2021-06-17  907   * * negative error code if n=
o data has been written at all of
fcf2d3b23ed11b David Howells 2021-06-17  908   *   vfs_fsync_range() failed=
 for a synchronous write
fcf2d3b23ed11b David Howells 2021-06-17  909   * * number of bytes written,=
 even for truncated writes
fcf2d3b23ed11b David Howells 2021-06-17  910   */
e237ecdc44f74b Jeff Layton   2022-07-01  911  ssize_t netfs_file_write_iter=
_locked(struct kiocb *iocb, struct iov_iter *from)
fcf2d3b23ed11b David Howells 2021-06-17  912  {
fcf2d3b23ed11b David Howells 2021-06-17  913  	struct file *file =3D iocb->=
ki_filp;
fcf2d3b23ed11b David Howells 2021-06-17  914  	struct inode *inode =3D file=
->f_mapping->host;
07b2258e7d9724 David Howells 2022-02-15  915  	struct netfs_inode *ctx =3D =
netfs_inode(inode);
fcf2d3b23ed11b David Howells 2021-06-17  916  	ssize_t ret;
fcf2d3b23ed11b David Howells 2021-06-17  917  =

fcf2d3b23ed11b David Howells 2021-06-17  918  	_enter("%llx,%zx,%llx", iocb=
->ki_pos, iov_iter_count(from), i_size_read(inode));
fcf2d3b23ed11b David Howells 2021-06-17  919  =

fcf2d3b23ed11b David Howells 2021-06-17  920  	ret =3D generic_write_checks=
(iocb, from);
fcf2d3b23ed11b David Howells 2021-06-17  921  	if (ret <=3D 0)
e237ecdc44f74b Jeff Layton   2022-07-01  922  		return ret;
fcf2d3b23ed11b David Howells 2021-06-17  923  =

fcf2d3b23ed11b David Howells 2021-06-17  924  	trace_netfs_write_iter(iocb,=
 from);
fcf2d3b23ed11b David Howells 2021-06-17  925  =

fcf2d3b23ed11b David Howells 2021-06-17  926  	/* We can write back this qu=
eue in page reclaim */
fcf2d3b23ed11b David Howells 2021-06-17  927  	current->backing_dev_info =
=3D inode_to_bdi(inode);
fcf2d3b23ed11b David Howells 2021-06-17  928  	ret =3D file_remove_privs(fi=
le);
fcf2d3b23ed11b David Howells 2021-06-17  929  	if (ret)
fcf2d3b23ed11b David Howells 2021-06-17  930  		goto error;
fcf2d3b23ed11b David Howells 2021-06-17  931  =

fcf2d3b23ed11b David Howells 2021-06-17  932  	ret =3D file_update_time(fil=
e);
fcf2d3b23ed11b David Howells 2021-06-17  933  	if (ret)
fcf2d3b23ed11b David Howells 2021-06-17  934  		goto error;
fcf2d3b23ed11b David Howells 2021-06-17  935  =

ce4670495468b7 David Howells 2022-02-07  936  	{
ce4670495468b7 David Howells 2022-02-07 @937  #warning TRIGGER NEW FLUSH GR=
OUP FOR TESTING
ce4670495468b7 David Howells 2022-02-07  938  		static atomic_t jump;
ce4670495468b7 David Howells 2022-02-07  939  		ret =3D netfs_require_flush=
_group(inode, (atomic_inc_return(&jump) & 3) =3D=3D 3);
ce4670495468b7 David Howells 2022-02-07  940  		if (ret < 0)
ce4670495468b7 David Howells 2022-02-07  941  			goto error;
ce4670495468b7 David Howells 2022-02-07  942  	}
ce4670495468b7 David Howells 2022-02-07  943  =

07b2258e7d9724 David Howells 2022-02-15  944  	ret =3D netfs_flush_conflict=
ing_writes(ctx, file, iocb->ki_pos,
07b2258e7d9724 David Howells 2022-02-15  945  					     iov_iter_count(from=
), NULL);
07b2258e7d9724 David Howells 2022-02-15  946  	if (ret < 0 && ret !=3D -EAG=
AIN)
07b2258e7d9724 David Howells 2022-02-15  947  		goto error;
07b2258e7d9724 David Howells 2022-02-15  948  =

fcf2d3b23ed11b David Howells 2021-06-17  949  	if (iocb->ki_flags & IOCB_DI=
RECT)
fcf2d3b23ed11b David Howells 2021-06-17  950  		ret =3D netfs_direct_write_=
iter(iocb, from);
fcf2d3b23ed11b David Howells 2021-06-17  951  	else
fcf2d3b23ed11b David Howells 2021-06-17  952  		ret =3D netfs_perform_write=
(iocb, from);
fcf2d3b23ed11b David Howells 2021-06-17  953  =

fcf2d3b23ed11b David Howells 2021-06-17  954  error:
fcf2d3b23ed11b David Howells 2021-06-17  955  	/* TODO: Wait for DSYNC regi=
on here. */
fcf2d3b23ed11b David Howells 2021-06-17  956  	current->backing_dev_info =
=3D NULL;
fcf2d3b23ed11b David Howells 2021-06-17  957  	return ret;
e237ecdc44f74b Jeff Layton   2022-07-01  958  }
e237ecdc44f74b Jeff Layton   2022-07-01  959  EXPORT_SYMBOL(netfs_file_writ=
e_iter_locked);
e237ecdc44f74b Jeff Layton   2022-07-01  960  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0273161567722523365==--

