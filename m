Content-Type: multipart/mixed; boundary="===============5501041325076322155=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/netfs-linked-list 57/57] fs/netfs/buffered_write.c:934:2: sparse: sparse: TRIGGER NEW FLUSH GROUP FOR TESTING
Date: Sat, 11 Jun 2022 16:15:38 +0800
Message-ID: <202206111618.NPSb5sVS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5501041325076322155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: fs/netfs/=
buffered_write.c:934:2: sparse: sparse: TRIGGER NEW FLUSH GROUP FOR TESTING"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/netfs-=
linked-list
head:   c19d336b7f0c53bd31e73f6d7d6c1524f0df55b8
commit: c19d336b7f0c53bd31e73f6d7d6c1524f0df55b8 [57/57] netfs: Add a struc=
t to group modifications together and flushed in order
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-s022 (https://download.01.org/0day-ci/archive/202=
20611/202206111618.NPSb5sVS-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/c19d336b7f0c53b=
d31e73f6d7d6c1524f0df55b8
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/netfs-linke=
d-list
        git checkout c19d336b7f0c53bd31e73f6d7d6c1524f0df55b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash fs/netfs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> fs/netfs/buffered_write.c:934:2: sparse: sparse: TRIGGER NEW FLUSH GROUP=
 FOR TESTING
   fs/netfs/buffered_write.c: note: in included file (through include/linux=
/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page
   include/linux/page-flags.h:788:9: sparse: sparse: incorrect type in argu=
ment 1 (different modifiers) @@     expected struct page *page @@     got s=
truct page const *page @@
   include/linux/page-flags.h:788:9: sparse:     expected struct page *page
   include/linux/page-flags.h:788:9: sparse:     got struct page const *page

vim +934 fs/netfs/buffered_write.c

b816d9b8d7d847 David Howells 2021-06-17  893  =

b816d9b8d7d847 David Howells 2021-06-17  894  /**
b816d9b8d7d847 David Howells 2021-06-17  895   * netfs_file_write_iter - wr=
ite data to a file
b816d9b8d7d847 David Howells 2021-06-17  896   * @iocb:	IO state structure
b816d9b8d7d847 David Howells 2021-06-17  897   * @from:	iov_iter with data =
to write
b816d9b8d7d847 David Howells 2021-06-17  898   *
b816d9b8d7d847 David Howells 2021-06-17  899   * This is a wrapper around _=
_generic_file_write_iter() to be used by most
b816d9b8d7d847 David Howells 2021-06-17  900   * filesystems. It takes care=
 of syncing the file in case of O_SYNC file and
b816d9b8d7d847 David Howells 2021-06-17  901   * acquires i_mutex as needed.
b816d9b8d7d847 David Howells 2021-06-17  902   * Return:
b816d9b8d7d847 David Howells 2021-06-17  903   * * negative error code if n=
o data has been written at all of
b816d9b8d7d847 David Howells 2021-06-17  904   *   vfs_fsync_range() failed=
 for a synchronous write
b816d9b8d7d847 David Howells 2021-06-17  905   * * number of bytes written,=
 even for truncated writes
b816d9b8d7d847 David Howells 2021-06-17  906   */
b816d9b8d7d847 David Howells 2021-06-17  907  ssize_t netfs_file_write_iter=
(struct kiocb *iocb, struct iov_iter *from)
b816d9b8d7d847 David Howells 2021-06-17  908  {
b816d9b8d7d847 David Howells 2021-06-17  909  	struct file *file =3D iocb->=
ki_filp;
b816d9b8d7d847 David Howells 2021-06-17  910  	struct inode *inode =3D file=
->f_mapping->host;
6c4c7b9e65c500 David Howells 2022-02-15  911  	struct netfs_inode *ctx =3D =
netfs_inode(inode);
b816d9b8d7d847 David Howells 2021-06-17  912  	ssize_t ret;
b816d9b8d7d847 David Howells 2021-06-17  913  =

b816d9b8d7d847 David Howells 2021-06-17  914  	_enter("%llx,%zx,%llx", iocb=
->ki_pos, iov_iter_count(from), i_size_read(inode));
b816d9b8d7d847 David Howells 2021-06-17  915  =

b816d9b8d7d847 David Howells 2021-06-17  916  	inode_lock(inode);
b816d9b8d7d847 David Howells 2021-06-17  917  	ret =3D generic_write_checks=
(iocb, from);
b816d9b8d7d847 David Howells 2021-06-17  918  	if (ret <=3D 0)
b816d9b8d7d847 David Howells 2021-06-17  919  		goto error_unlock;
b816d9b8d7d847 David Howells 2021-06-17  920  =

b816d9b8d7d847 David Howells 2021-06-17  921  	trace_netfs_write_iter(iocb,=
 from);
b816d9b8d7d847 David Howells 2021-06-17  922  =

b816d9b8d7d847 David Howells 2021-06-17  923  	/* We can write back this qu=
eue in page reclaim */
b816d9b8d7d847 David Howells 2021-06-17  924  	current->backing_dev_info =
=3D inode_to_bdi(inode);
b816d9b8d7d847 David Howells 2021-06-17  925  	ret =3D file_remove_privs(fi=
le);
b816d9b8d7d847 David Howells 2021-06-17  926  	if (ret)
b816d9b8d7d847 David Howells 2021-06-17  927  		goto error;
b816d9b8d7d847 David Howells 2021-06-17  928  =

b816d9b8d7d847 David Howells 2021-06-17  929  	ret =3D file_update_time(fil=
e);
b816d9b8d7d847 David Howells 2021-06-17  930  	if (ret)
b816d9b8d7d847 David Howells 2021-06-17  931  		goto error;
b816d9b8d7d847 David Howells 2021-06-17  932  =

c19d336b7f0c53 David Howells 2022-02-07  933  	{
c19d336b7f0c53 David Howells 2022-02-07 @934  #warning TRIGGER NEW FLUSH GR=
OUP FOR TESTING
c19d336b7f0c53 David Howells 2022-02-07  935  		static atomic_t jump;
c19d336b7f0c53 David Howells 2022-02-07  936  		ret =3D netfs_require_flush=
_group(inode, (atomic_inc_return(&jump) & 3) =3D=3D 3);
c19d336b7f0c53 David Howells 2022-02-07  937  		if (ret < 0)
c19d336b7f0c53 David Howells 2022-02-07  938  			goto error;
c19d336b7f0c53 David Howells 2022-02-07  939  	}
c19d336b7f0c53 David Howells 2022-02-07  940  =

6c4c7b9e65c500 David Howells 2022-02-15  941  	ret =3D netfs_flush_conflict=
ing_writes(ctx, file, iocb->ki_pos,
6c4c7b9e65c500 David Howells 2022-02-15  942  					     iov_iter_count(from=
), NULL);
6c4c7b9e65c500 David Howells 2022-02-15  943  	if (ret < 0 && ret !=3D -EAG=
AIN)
6c4c7b9e65c500 David Howells 2022-02-15  944  		goto error;
6c4c7b9e65c500 David Howells 2022-02-15  945  =

b816d9b8d7d847 David Howells 2021-06-17  946  	if (iocb->ki_flags & IOCB_DI=
RECT)
b816d9b8d7d847 David Howells 2021-06-17  947  		ret =3D netfs_direct_write_=
iter(iocb, from);
b816d9b8d7d847 David Howells 2021-06-17  948  	else
b816d9b8d7d847 David Howells 2021-06-17  949  		ret =3D netfs_perform_write=
(iocb, from);
b816d9b8d7d847 David Howells 2021-06-17  950  =

b816d9b8d7d847 David Howells 2021-06-17  951  error:
b816d9b8d7d847 David Howells 2021-06-17  952  	inode_unlock(inode);
b816d9b8d7d847 David Howells 2021-06-17  953  	/* TODO: Wait for DSYNC regi=
on here. */
b816d9b8d7d847 David Howells 2021-06-17  954  	current->backing_dev_info =
=3D NULL;
b816d9b8d7d847 David Howells 2021-06-17  955  	return ret;
b816d9b8d7d847 David Howells 2021-06-17  956  error_unlock:
b816d9b8d7d847 David Howells 2021-06-17  957  	inode_unlock(inode);
b816d9b8d7d847 David Howells 2021-06-17  958  	return ret;
b816d9b8d7d847 David Howells 2021-06-17  959  }
b816d9b8d7d847 David Howells 2021-06-17  960  EXPORT_SYMBOL(netfs_file_writ=
e_iter);
6c34733101bfc2 David Howells 2022-02-15  961  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5501041325076322155==--

