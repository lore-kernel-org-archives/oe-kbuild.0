Content-Type: multipart/mixed; boundary="===============8208487898947176722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [djwong-xfs:vectorized-scrub 121/367] fs/xfs/libxfs/xfs_dir2_block.c:653:13: warning: dereference of NULL 'bp' [CWE-476]
Date: Wed, 15 Jun 2022 17:10:45 +0800
Message-ID: <202206151742.zTBR6kB6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8208487898947176722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/xfs/li=
bxfs/xfs_dir2_block.c:653:13: warning: dereference of NULL 'bp' [CWE-476] [=
-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: linux-kernel(a)vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.gi=
t vectorized-scrub
head:   879e09570c469d3320e25aa7f625ded1a2f5c24e
commit: bb42e8154500a2fea7cb7b4b1976cf76ba29d267 [121/367] xfs: report dir/=
attr block corruption errors to the health system
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220615/202206151742.zTBR6kB6-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.=
git/commit/?id=3Dbb42e8154500a2fea7cb7b4b1976cf76ba29d267
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kern=
el/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout bb42e8154500a2fea7cb7b4b1976cf76ba29d267
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/libxfs/xfs_dir2_block.c: In function 'xfs_dir2_block_lookup':
>> fs/xfs/libxfs/xfs_dir2_block.c:653:13: warning: dereference of NULL 'bp'=
 [CWE-476] [-Wanalyzer-null-dereference]
     653 |         hdr =3D bp->b_addr;
         |         ~~~~^~~~~~~~~~~~
     'xfs_dir2_block_lookup': event 1
       |
       |  632 | xfs_dir2_block_lookup(
       |      | ^~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_dir2_block_lookup'
       |
     'xfs_dir2_block_lookup': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kbp=1B[m=1B[K' is NULL
       |
     'xfs_dir2_block_lookup': event 3
       |
       |  650 |         if ((error =3D xfs_dir2_block_lookup_int(args, &bp,=
 &ent)))
       |      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |                      |
       |      |                      (3) calling 'xfs_dir2_block_lookup_int=
' from 'xfs_dir2_block_lookup'
       |
       +--> 'xfs_dir2_block_lookup_int': event 4
              |
              |  677 | xfs_dir2_block_lookup_int(
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (4) entry to 'xfs_dir2_block_lookup_int'
              |
            'xfs_dir2_block_lookup_int': event 5
              |
              |cc1:
              | (5): '=1B[01m=1B[Kbp=1B[m=1B[K' is NULL
              |
            'xfs_dir2_block_lookup_int': events 6-7
              |
              |  701 |         if (error)
              |      |            ^
              |      |            |
              |      |            (6) following 'false' branch (when 'error=
 =3D=3D 0')...
              |......
              |  704 |         hdr =3D bp->b_addr;
              |      |                 ~~
              |      |                 |
              |      |                 (7) ...to here
              |
            'xfs_dir2_block_lookup_int': event 8
              |
              |fs/xfs/xfs_linux.h:206:33:
              |  206 |         (likely(expr) ? (void)0 : assfail(NULL, #exp=
r, __FILE__, __LINE__))
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                                 |
              |      |                                 (8) following 'false=
' branch...
   fs/xfs/libxfs/xfs_dir2_block.c:761:9: note: in expansion of macro 'ASSER=
T'
              |  761 |         ASSERT(args->op_flags & XFS_DA_OP_OKNOENT);
              |      |         ^~~~~~
              |
            'xfs_dir2_block_lookup_int': events 9-10
              |
              |  766 |         if (args->cmpresult =3D=3D XFS_CMP_CASE)
              |      |            ~~~~~^~~~~~~~~~~
              |      |            |    |
              |      |            |    (9) ...to here
              |      |            (10) following 'true' branch...
              |
            'xfs_dir2_block_lookup_int': event 11
              |
              |cc1:
              | (11): ...to here
              |
       <------+
       |
     'xfs_dir2_block_lookup': events 12-16
       |
       |  650 |         if ((error =3D xfs_dir2_block_lookup_int(args, &bp,=
 &ent)))
       |      |            ~         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
       |      |            |         |
       |      |            |         (12) returning to 'xfs_dir2_block_look=
up' from 'xfs_dir2_block_lookup_int'
       |      |            (13) following 'false' branch (when 'error =3D=
=3D 0')...
       |  651 |                 return error;
       |  652 |         dp =3D args->dp;
       |      |         ~~~~~~~~~~~~~ =

       |      |            |
       |      |            (14) ...to here
       |  653 |         hdr =3D bp->b_addr;
       |      |         ~~~~~~~~~~~~~~~~
       |      |             |   |
       |      |             |   (15) 'bp' is NULL
       |      |             (16) dereference of NULL 'bp'
       |
   fs/xfs/libxfs/xfs_dir2_block.c: In function 'xfs_dir2_block_removename':
   fs/xfs/libxfs/xfs_dir2_block.c:808:13: warning: dereference of NULL 'bp'=
 [CWE-476] [-Wanalyzer-null-dereference]
     808 |         hdr =3D bp->b_addr;
         |         ~~~~^~~~~~~~~~~~
     'xfs_dir2_block_removename': event 1
       |
       |  780 | xfs_dir2_block_removename(
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_dir2_block_removename'
       |
--
   fs/xfs/libxfs/xfs_dir2_node.c: In function 'xfs_dir2_node_addname_int':
>> fs/xfs/libxfs/xfs_dir2_node.c:1959:13: warning: dereference of NULL 'dbp=
' [CWE-476] [-Wanalyzer-null-dereference]
    1959 |         hdr =3D dbp->b_addr;
         |         ~~~~^~~~~~~~~~~~~
     'xfs_dir2_node_addname_int': event 1
       |
       | 1901 | xfs_dir2_node_addname_int(
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      | |
       |      | (1) entry to 'xfs_dir2_node_addname_int'
       |
     'xfs_dir2_node_addname_int': event 2
       |
       |cc1:
       | (2): '=1B[01m=1B[Kdbp=1B[m=1B[K' is NULL
       |
     'xfs_dir2_node_addname_int': event 3
       |
       |cc1:
       | (3): '=1B[01m=1B[Kdbp=1B[m=1B[K' is NULL
       |
     'xfs_dir2_node_addname_int': event 4
       |
       | 1925 |         error =3D xfs_dir2_node_find_freeblk(args, fblk, &d=
bno, &fbp, &freehdr,
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (4) calling 'xfs_dir2_node_find_freeblk' fr=
om 'xfs_dir2_node_addname_int'
       | 1926 |                                            &findex, length);
       |      |                                            ~~~~~~~~~~~~~~~~
       |
       +--> 'xfs_dir2_node_find_freeblk': event 5
              |
              | 1796 | xfs_dir2_node_find_freeblk(
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (5) entry to 'xfs_dir2_node_find_freeblk'
              |
            'xfs_dir2_node_find_freeblk': event 6
              |
              |cc1:
              | (6): '=1B[01m=1B[Kfbp=1B[m=1B[K' is NULL
              |
       <------+
       |
     'xfs_dir2_node_addname_int': events 7-14
       |
       | 1925 |         error =3D xfs_dir2_node_find_freeblk(args, fblk, &d=
bno, &fbp, &freehdr,
       |      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (7) returning to 'xfs_dir2_node_addname_int=
' from 'xfs_dir2_node_find_freeblk'
       | 1926 |                                            &findex, length);
       |      |                                            ~~~~~~~~~~~~~~~~
       | 1927 |         if (error)
       |      |            ~     =

       |      |            |
       |      |            (8) following 'false' branch (when 'error =3D=3D=
 0')...
       |......
       | 1934 |         if (args->op_flags & XFS_DA_OP_JUSTCHECK) {
       |      |            ~~~~~~~~~~~~~~~
       |      |            |    |
       |      |            |    (9) ...to here
       |      |            (10) following 'false' branch...
       |......
       | 1944 |         if (dbno =3D=3D -1) {
       |      |            ~~~~~~~~~~~
       |      |            |     |
       |      |            |     (11) ...to here
       |      |            (12) following 'true' branch...
       |......
       | 1947 |                 error =3D xfs_dir2_node_add_datablk(args, f=
blk, &dbno, &dbp, &fbp,
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (13) ...to here
       |      |                         (14) calling 'xfs_dir2_node_add_dat=
ablk' from 'xfs_dir2_node_addname_int'
       | 1948 |                                                   &freehdr,=
 &findex);
       |      |                                                   ~~~~~~~~~=
~~~~~~~~~
       |
       +--> 'xfs_dir2_node_add_datablk': event 15
              |
              | 1683 | xfs_dir2_node_add_datablk(
              |      | ^~~~~~~~~~~~~~~~~~~~~~~~~
              |      | |
              |      | (15) entry to 'xfs_dir2_node_add_datablk'
              |
            'xfs_dir2_node_add_datablk': event 16
              |
              |cc1:
              | (16): '=1B[01m=1B[Kfbp=1B[m=1B[K' is NULL
              |
            'xfs_dir2_node_add_datablk': event 17
              |
              |cc1:
              | (17): '=1B[01m=1B[Kfbp=1B[m=1B[K' is NULL
              |
       <------+
       |
     'xfs_dir2_node_addname_int': events 18-22
       |
       | 1947 |                 error =3D xfs_dir2_node_add_datablk(args, f=
blk, &dbno, &dbp, &fbp,
       |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (18) returning to 'xfs_dir2_node_ad=
dname_int' from 'xfs_dir2_node_add_datablk'

vim +/bp +653 fs/xfs/libxfs/xfs_dir2_block.c

^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 626  =

^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 627  /*
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 628   * Look up an entry in the block.  This is the external routine,
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 629   * xfs_dir2_block_lookup_int does the real work.
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 630   */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 631  int						/* error */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 632  xfs_dir2_block_lookup(
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 633  	xfs_da_args_t		*args)		/* dir lookup arguments */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 634  {
4f6ae1a49ed5c8 fs/xfs/xfs_dir2_block.c        Christoph Hellwig 2011-07-08 =
 635  	xfs_dir2_data_hdr_t	*hdr;		/* block header */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 636  	xfs_dir2_leaf_entry_t	*blp;		/* block leaf entries */
1d9025e56143c0 fs/xfs/xfs_dir2_block.c        Dave Chinner      2012-06-22 =
 637  	struct xfs_buf		*bp;		/* block buffer */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 638  	xfs_dir2_block_tail_t	*btp;		/* block tail */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 639  	xfs_dir2_data_entry_t	*dep;		/* block data entry */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 640  	xfs_inode_t		*dp;		/* incore inode */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 641  	int			ent;		/* entry index */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 642  	int			error;		/* error return value */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 643  =

0b1b213fcf3a84 fs/xfs/xfs_dir2_block.c        Christoph Hellwig 2009-12-14 =
 644  	trace_xfs_dir2_block_lookup(args);
0b1b213fcf3a84 fs/xfs/xfs_dir2_block.c        Christoph Hellwig 2009-12-14 =
 645  =

^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 646  	/*
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 647  	 * Get the buffer, look up the entry.
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 648  	 * If not found (ENOENT) then return, have no buffer.
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 649  	 */
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 650  	if ((error =3D xfs_dir2_block_lookup_int(args, &bp, &ent)))
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 651  		return error;
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 652  	dp =3D args->dp;
1d9025e56143c0 fs/xfs/xfs_dir2_block.c        Dave Chinner      2012-06-22 =
@653  	hdr =3D bp->b_addr;
33363feed1614d fs/xfs/xfs_dir2_block.c        Dave Chinner      2013-04-03 =
 654  	xfs_dir3_data_check(dp, bp);
8f66193c89f0b0 fs/xfs/xfs_dir2_block.c        Dave Chinner      2014-06-06 =
 655  	btp =3D xfs_dir2_block_tail_p(args->geo, hdr);
bbaaf53808c778 fs/xfs/xfs_dir2_block.c        Christoph Hellwig 2007-06-28 =
 656  	blp =3D xfs_dir2_block_leaf_p(btp);
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 657  	/*
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 658  	 * Get the offset from the leaf entry, to point to the data.
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 659  	 */
4f6ae1a49ed5c8 fs/xfs/xfs_dir2_block.c        Christoph Hellwig 2011-07-08 =
 660  	dep =3D (xfs_dir2_data_entry_t *)((char *)hdr +
30028030b14d08 fs/xfs/xfs_dir2_block.c        Dave Chinner      2014-06-06 =
 661  			xfs_dir2_dataptr_to_off(args->geo,
30028030b14d08 fs/xfs/xfs_dir2_block.c        Dave Chinner      2014-06-06 =
 662  						be32_to_cpu(blp[ent].address)));
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 663  	/*
384f3ced07efdd fs/xfs/xfs_dir2_block.c        Barry Naujok      2008-05-21 =
 664  	 * Fill in inode number, CI name if appropriate, release the block.
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 665  	 */
ff9901c1e7c7be fs/xfs/xfs_dir2_block.c        Christoph Hellwig 2006-06-09 =
 666  	args->inumber =3D be64_to_cpu(dep->inumber);
59b8b465058ec2 fs/xfs/libxfs/xfs_dir2_block.c Christoph Hellwig 2019-11-08 =
 667  	args->filetype =3D xfs_dir2_data_get_ftype(dp->i_mount, dep);
384f3ced07efdd fs/xfs/xfs_dir2_block.c        Barry Naujok      2008-05-21 =
 668  	error =3D xfs_dir_cilookup_result(args, dep->name, dep->namelen);
1d9025e56143c0 fs/xfs/xfs_dir2_block.c        Dave Chinner      2012-06-22 =
 669  	xfs_trans_brelse(args->trans, bp);
b474c7ae4395ba fs/xfs/xfs_dir2_block.c        Eric Sandeen      2014-06-22 =
 670  	return error;
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 671  }
^1da177e4c3f41 fs/xfs/xfs_dir2_block.c        Linus Torvalds    2005-04-16 =
 672  =


:::::: The code at line 653 was first introduced by commit
:::::: 1d9025e56143c0c4aebebdb62e46618d3d284218 xfs: remove struct xfs_dabu=
f and infrastructure

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Ben Myers <bpm@sgi.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8208487898947176722==--

