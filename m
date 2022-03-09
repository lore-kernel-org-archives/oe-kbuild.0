Content-Type: multipart/mixed; boundary="===============2218895405216537930=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/xfs/scrub/bmap.c:621:2: warning: Undefined or garbage value returned to caller [clang-analyzer-core.uninitialized.UndefReturn]
Date: Thu, 10 Mar 2022 02:02:25 +0800
Message-ID: <202203100110.j21o44w0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2218895405216537930==
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
head:   330f4c53d3c2d8b11d86ec03a964b86dc81452f5
commit: 934933c3eec9e4a5826d3d7a47aca0742337fded xfs: convert raw ag walks =
to use for_each_perag
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-c002-20220308 (https://download.01.org/0day-ci/archi=
ve/20220310/202203100110.j21o44w0-lkp(a)intel.com/config)
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
           ^
   include/linux/hid.h:1002:2: note: Taking true branch
           if (unlikely(c > limit || !bmap)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/hid.h:1003:3: note: Assuming the condition is false
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/hid.h:1003:3: note: '?' condition is false
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/hid.h:1003:3: note: Assuming the condition is false
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   include/linux/hid.h:1003:3: note: '?' condition is true
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
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
           ^
   include/linux/hid.h:1003:3: note: Taking true branch
                   pr_warn_ratelimited("%s: Invalid code %d type %d\n",
                   ^
   include/linux/printk.h:528:2: note: expanded from macro 'pr_warn_ratelim=
ited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:511:2: note: expanded from macro 'printk_ratelimi=
ted'
           if (__ratelimit(&_rs))                                          \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/hid.h:1004:9: note: Access to field 'name' results in a de=
reference of a null pointer (loaded from variable 'input')
                                       input->name, c, type);
                                       ^
   include/linux/printk.h:528:49: note: expanded from macro 'pr_warn_rateli=
mited'
           printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                                                          ^~~~~~~~~~~
   include/linux/printk.h:512:17: note: expanded from macro 'printk_ratelim=
ited'
                   printk(fmt, ##__VA_ARGS__);                             \
                                 ^~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
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

5e777b62b0bcb6 Darrick J. Wong   2018-03-23  571  =

5e777b62b0bcb6 Darrick J. Wong   2018-03-23  572  /* Make sure each rmap ha=
s a corresponding bmbt entry. */
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  573  STATIC int
c517b3aa02cff1 Darrick J. Wong   2018-07-19  574  xchk_bmap_check_rmaps(
1d8a748a8aa94a Darrick J. Wong   2018-07-19  575  	struct xfs_scrub	*sc,
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  576  	int			whichfork)
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  577  {
daf83964a3681c Christoph Hellwig 2020-05-18  578  	struct xfs_ifork	*ifp =
=3D XFS_IFORK_PTR(sc->ip, whichfork);
934933c3eec9e4 Dave Chinner      2021-06-02  579  	struct xfs_perag	*pag;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  580  	xfs_agnumber_t		agno;
5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  581  	bool			zero_size;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  582  	int			error;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  583  =

5e777b62b0bcb6 Darrick J. Wong   2018-03-23  584  	if (!xfs_sb_version_hasr=
mapbt(&sc->mp->m_sb) ||
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  585  	    whichfork =3D=3D XFS=
_COW_FORK ||
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  586  	    (sc->sm->sm_flags & =
XFS_SCRUB_OFLAG_CORRUPT))
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  587  		return 0;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  588  =

5e777b62b0bcb6 Darrick J. Wong   2018-03-23  589  	/* Don't support realtim=
e rmap checks yet. */
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  590  	if (XFS_IS_REALTIME_INOD=
E(sc->ip) && whichfork =3D=3D XFS_DATA_FORK)
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  591  		return 0;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  592  =

5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  593  	ASSERT(XFS_IFORK_PTR(sc-=
>ip, whichfork) !=3D NULL);
5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  594  =

5e777b62b0bcb6 Darrick J. Wong   2018-03-23  595  	/*
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  596  	 * Only do this for comp=
lex maps that are in btree format, or for
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  597  	 * situations where we w=
ould seem to have a size but zero extents.
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  598  	 * The inode repair code=
 can zap broken iforks, which means we have
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  599  	 * to flag this bmap as =
corrupt if there are rmaps that need to be
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  600  	 * reattached.
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  601  	 */
f7e67b20ecbbcb Christoph Hellwig 2020-05-18  602  =

5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  603  	if (whichfork =3D=3D XFS=
_DATA_FORK)
5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  604  		zero_size =3D i_size_re=
ad(VFS_I(sc->ip)) =3D=3D 0;
5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  605  	else
5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  606  		zero_size =3D false;
5fd68bdb5a87c9 Darrick J. Wong   2020-05-16  607  =

f7e67b20ecbbcb Christoph Hellwig 2020-05-18  608  	if (ifp->if_format !=3D =
XFS_DINODE_FMT_BTREE &&
daf83964a3681c Christoph Hellwig 2020-05-18  609  	    (zero_size || ifp->i=
f_nextents > 0))
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  610  		return 0;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  611  =

934933c3eec9e4 Dave Chinner      2021-06-02  612  	for_each_perag(sc->mp, a=
gno, pag) {
934933c3eec9e4 Dave Chinner      2021-06-02  613  		error =3D xchk_bmap_che=
ck_ag_rmaps(sc, whichfork, pag->pag_agno);
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  614  		if (error)
934933c3eec9e4 Dave Chinner      2021-06-02  615  			break;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  616  		if (sc->sm->sm_flags & =
XFS_SCRUB_OFLAG_CORRUPT)
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  617  			break;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  618  	}
934933c3eec9e4 Dave Chinner      2021-06-02  619  	if (pag)
934933c3eec9e4 Dave Chinner      2021-06-02  620  		xfs_perag_put(pag);
934933c3eec9e4 Dave Chinner      2021-06-02 @621  	return error;
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  622  }
5e777b62b0bcb6 Darrick J. Wong   2018-03-23  623  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2218895405216537930==--

