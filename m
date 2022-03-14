Content-Type: multipart/mixed; boundary="===============7680575112530998173=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/scrub/bmap.c:621:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Tue, 15 Mar 2022 06:00:42 +0800
Message-ID: <202203150526.Dy4qHmvL-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7680575112530998173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Dave Chinner <dchinner@redhat.com>
CC: Brian Foster <bfoster@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 934933c3eec9e4a5826d3d7a47aca0742337fded xfs: convert raw ag walks =
to use for_each_perag
date:   10 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220315/202203150526.Dy4qHmvL-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D934933c3eec9e4a5826d3d7a47aca0742337fded
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 934933c3eec9e4a5826d3d7a47aca0742337fded
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/usb/gadget/udc/gr_udc.c:614:9: note: Calling 'gr_setup_out_desc_=
list'
                   ret =3D gr_setup_out_desc_list(ep, req, gfp_flags);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:482:2: note: Null pointer value stored t=
o field 'first_desc'
           req->first_desc =3D NULL; /* Signals that no allocation is done =
yet */
           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:485:9: note: Assuming 'bytes_left' is <=
=3D 0
           while (bytes_left > 0) {
                  ^~~~~~~~~~~~~~
   drivers/usb/gadget/udc/gr_udc.c:485:2: note: Loop condition is false. Ex=
ecution continues on line 503
           while (bytes_left > 0) {
           ^
   drivers/usb/gadget/udc/gr_udc.c:503:24: note: Access to field 'ctrl' res=
ults in a dereference of a null pointer (loaded from field 'first_desc')
           req->first_desc->ctrl |=3D GR_DESC_OUT_CTRL_EN;
                ~~~~~~~~~~       ^
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:387:2: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/analogix-anx6345.c:387:2: note: Value st=
ored to 'err' is never read
           err =3D anx6345_clear_bits(anx6345->map[I2C_IDX_TXCOM],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:424:2: warning: Value =
stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg =3D readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
           ^
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:424:2: note: Value sto=
red to 'reg' is never read
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/xfs/xfs_pnfs.c:39:3: warning: Value stored to 'error' is never read [=
clang-analyzer-deadcode.DeadStores]
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_pnfs.c:39:3: note: Value stored to 'error' is never read
                   error =3D break_layout(inode, true);
                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> fs/xfs/scrub/bmap.c:621:2: warning: Undefined or garbage value returned =
to caller [clang-analyzer-core.uninitialized.UndefReturn]
           return error;
           ^      ~~~~~
   fs/xfs/scrub/bmap.c:578:26: note: Assuming 'whichfork' is not equal to 0
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:578:26: note: '?' condition is false
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:98:3: note: expanded from macro 'XFS_IFOR=
K_PTR'
           ((w) =3D=3D XFS_DATA_FORK ? \
            ^
   fs/xfs/scrub/bmap.c:578:26: note: Assuming 'whichfork' is equal to 1
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:578:26: note: '?' condition is true
           struct xfs_ifork        *ifp =3D XFS_IFORK_PTR(sc->ip, whichfork=
);
                                          ^
   fs/xfs/libxfs/xfs_inode_fork.h:100:4: note: expanded from macro 'XFS_IFO=
RK_PTR'
                   ((w) =3D=3D XFS_ATTR_FORK ? \
                    ^
   fs/xfs/scrub/bmap.c:582:2: note: 'error' declared without an initial val=
ue
           int                     error;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/bmap.c:584:6: note: Assuming the condition is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:584:6: note: Left side of '||' is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
               ^
   fs/xfs/scrub/bmap.c:585:6: note: 'whichfork' is not equal to 2
               whichfork =3D=3D XFS_COW_FORK ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:584:6: note: Left side of '||' is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
               ^
   fs/xfs/scrub/bmap.c:584:2: note: Assuming the condition is true
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/xfs/scrub/bmap.c:584:2: note: '?' condition is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/xfs/scrub/bmap.c:584:6: note: Left side of '||' is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
               ^
   fs/xfs/scrub/bmap.c:585:6: note: 'whichfork' is not equal to 2
               whichfork =3D=3D XFS_COW_FORK ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/xfs/scrub/bmap.c:584:6: note: Left side of '||' is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
               ^
   fs/xfs/scrub/bmap.c:584:2: note: '?' condition is false
           if (!xfs_sb_version_hasrmapbt(&sc->mp->m_sb) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \

vim +621 fs/xfs/scrub/bmap.c

5e777b62b0bcb64 Darrick J. Wong   2018-03-23  571  =

5e777b62b0bcb64 Darrick J. Wong   2018-03-23  572  /* Make sure each rmap h=
as a corresponding bmbt entry. */
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  573  STATIC int
c517b3aa02cff1d Darrick J. Wong   2018-07-19  574  xchk_bmap_check_rmaps(
1d8a748a8aa94a7 Darrick J. Wong   2018-07-19  575  	struct xfs_scrub	*sc,
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  576  	int			whichfork)
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  577  {
daf83964a3681cf Christoph Hellwig 2020-05-18  578  	struct xfs_ifork	*ifp =
=3D XFS_IFORK_PTR(sc->ip, whichfork);
934933c3eec9e4a Dave Chinner      2021-06-02  579  	struct xfs_perag	*pag;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  580  	xfs_agnumber_t		agno;
5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  581  	bool			zero_size;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  582  	int			error;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  583  =

5e777b62b0bcb64 Darrick J. Wong   2018-03-23  584  	if (!xfs_sb_version_has=
rmapbt(&sc->mp->m_sb) ||
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  585  	    whichfork =3D=3D XF=
S_COW_FORK ||
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  586  	    (sc->sm->sm_flags &=
 XFS_SCRUB_OFLAG_CORRUPT))
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  587  		return 0;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  588  =

5e777b62b0bcb64 Darrick J. Wong   2018-03-23  589  	/* Don't support realti=
me rmap checks yet. */
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  590  	if (XFS_IS_REALTIME_INO=
DE(sc->ip) && whichfork =3D=3D XFS_DATA_FORK)
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  591  		return 0;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  592  =

5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  593  	ASSERT(XFS_IFORK_PTR(sc=
->ip, whichfork) !=3D NULL);
5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  594  =

5e777b62b0bcb64 Darrick J. Wong   2018-03-23  595  	/*
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  596  	 * Only do this for com=
plex maps that are in btree format, or for
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  597  	 * situations where we =
would seem to have a size but zero extents.
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  598  	 * The inode repair cod=
e can zap broken iforks, which means we have
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  599  	 * to flag this bmap as=
 corrupt if there are rmaps that need to be
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  600  	 * reattached.
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  601  	 */
f7e67b20ecbbcb9 Christoph Hellwig 2020-05-18  602  =

5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  603  	if (whichfork =3D=3D XF=
S_DATA_FORK)
5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  604  		zero_size =3D i_size_r=
ead(VFS_I(sc->ip)) =3D=3D 0;
5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  605  	else
5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  606  		zero_size =3D false;
5fd68bdb5a87c92 Darrick J. Wong   2020-05-16  607  =

f7e67b20ecbbcb9 Christoph Hellwig 2020-05-18  608  	if (ifp->if_format !=3D=
 XFS_DINODE_FMT_BTREE &&
daf83964a3681cf Christoph Hellwig 2020-05-18  609  	    (zero_size || ifp->=
if_nextents > 0))
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  610  		return 0;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  611  =

934933c3eec9e4a Dave Chinner      2021-06-02  612  	for_each_perag(sc->mp, =
agno, pag) {
934933c3eec9e4a Dave Chinner      2021-06-02  613  		error =3D xchk_bmap_ch=
eck_ag_rmaps(sc, whichfork, pag->pag_agno);
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  614  		if (error)
934933c3eec9e4a Dave Chinner      2021-06-02  615  			break;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  616  		if (sc->sm->sm_flags &=
 XFS_SCRUB_OFLAG_CORRUPT)
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  617  			break;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  618  	}
934933c3eec9e4a Dave Chinner      2021-06-02  619  	if (pag)
934933c3eec9e4a Dave Chinner      2021-06-02  620  		xfs_perag_put(pag);
934933c3eec9e4a Dave Chinner      2021-06-02 @621  	return error;
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  622  }
5e777b62b0bcb64 Darrick J. Wong   2018-03-23  623  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7680575112530998173==--

