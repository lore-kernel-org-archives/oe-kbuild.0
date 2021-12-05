Content-Type: multipart/mixed; boundary="===============3086896616333782212=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 12/36] xfs: Pre-calculate per-AG agino geometry
Date: Sun, 05 Dec 2021 12:36:45 +0800
Message-ID: <202112051217.mRdxC4Nd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3086896616333782212==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211203000111.2800982-13-david@fromorbit.com>
References: <20211203000111.2800982-13-david@fromorbit.com>
TO: Dave Chinner <david@fromorbit.com>
TO: linux-xfs(a)vger.kernel.org

Hi Dave,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dave-Chinner/xfs-more-work=
-towards-shrinking/20211203-080331
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20211203 (https://download.01.org/0day-ci/arch=
ive/20211205/202112051217.mRdxC4Nd-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d30fca=
df07ee552f20156ea90be2fdb54cb9cb08)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/1970e03e85e3d4f96bdeeb1bc=
536f025b50737d1
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dave-Chinner/xfs-more-work-towards=
-shrinking/20211203-080331
        git checkout 1970e03e85e3d4f96bdeeb1bc536f025b50737d1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4717:35: note: Passing the value 0 via 3rd parameter 't=
otal'
           rt6_upper_bound_set(rt, &weight, total);
                                            ^~~~~
   net/ipv6/route.c:4717:2: note: Calling 'rt6_upper_bound_set'
           rt6_upper_bound_set(rt, &weight, total);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4704:7: note: Calling 'rt6_is_dead'
           if (!rt6_is_dead(rt)) {
                ^~~~~~~~~~~~~~~
   net/ipv6/route.c:4676:6: note: Left side of '||' is false
           if (rt->fib6_nh->fib_nh_flags & RTNH_F_DEAD ||
               ^
   net/ipv6/route.c:4677:7: note: Left side of '&&' is true
               (rt->fib6_nh->fib_nh_flags & RTNH_F_LINKDOWN &&
                ^
   net/ipv6/route.c:4678:7: note: Calling 'ip6_ignore_linkdown'
                ip6_ignore_linkdown(rt->fib6_nh->fib_nh_dev)))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/addrconf.h:406:10: note: Assuming field 'ignore_routes_with_=
linkdown' is 0, which participates in a condition later
           return !!idev->cnf.ignore_routes_with_linkdown;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/addrconf.h:406:2: note: Returning zero, which participates i=
n a condition later
           return !!idev->cnf.ignore_routes_with_linkdown;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4678:7: note: Returning from 'ip6_ignore_linkdown'
                ip6_ignore_linkdown(rt->fib6_nh->fib_nh_dev)))
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4676:2: note: Taking false branch
           if (rt->fib6_nh->fib_nh_flags & RTNH_F_DEAD ||
           ^
   net/ipv6/route.c:4681:2: note: Returning zero, which participates in a c=
ondition later
           return false;
           ^~~~~~~~~~~~
   net/ipv6/route.c:4704:7: note: Returning from 'rt6_is_dead'
           if (!rt6_is_dead(rt)) {
                ^~~~~~~~~~~~~~~
   net/ipv6/route.c:4704:2: note: Taking true branch
           if (!rt6_is_dead(rt)) {
           ^
   net/ipv6/route.c:4706:17: note: '__d' initialized to 0
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:102:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           typeof(divisor) __d =3D divisor;                  \
           ^~~~~~~~~~~~~~~~~~~
   net/ipv6/route.c:4706:17: note: The value 0 is assigned to '__base'
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/div64.h:25:2: note: expanded from macro 'do_div'
           __base =3D (base);                                        \
           ^~~~~~~~~~~~~~~
   net/ipv6/route.c:4706:17: note: Left side of '&&' is false
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^
   arch/x86/include/asm/div64.h:26:35: note: expanded from macro 'do_div'
           if (__builtin_constant_p(__base) && is_power_of_2(__base)) { \
                                            ^
   net/ipv6/route.c:4706:17: note: Assuming '__high' is not equal to 0
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/div64.h:32:7: note: expanded from macro 'do_div'
                   if (__high) {                                   \
                       ^~~~~~
   net/ipv6/route.c:4706:17: note: Taking true branch
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^
   arch/x86/include/asm/div64.h:32:3: note: expanded from macro 'do_div'
                   if (__high) {                                   \
                   ^
   net/ipv6/route.c:4706:17: note: Division by zero
                   upper_bound =3D DIV_ROUND_CLOSEST_ULL((u64) (*weight) <<=
 31,
                                 ^
   include/linux/math.h:104:2: note: expanded from macro 'DIV_ROUND_CLOSEST=
_ULL'
           do_div(_tmp, __d);                              \
           ^~~~~~~~~~~~~~~~~
   arch/x86/include/asm/div64.h:33:21: note: expanded from macro 'do_div'
                           __upper =3D __high % (__base);            \
                                     ~~~~~~~^~~~~~~~~~
   net/ipv6/route.c:5904:11: warning: Although the value stored to 'count' =
is used in the enclosing expression, the value is never actually read from =
'count' [clang-analyzer-deadcode.DeadStores]
                           return count +=3D w.count;
                                  ^        ~~~~~~~
   net/ipv6/route.c:5904:11: note: Although the value stored to 'count' is =
used in the enclosing expression, the value is never actually read from 'co=
unt'
                           return count +=3D w.count;
                                  ^        ~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> fs/xfs/libxfs/xfs_inode_buf.c:52:2: warning: Value stored to 'agno' is n=
ever read [clang-analyzer-deadcode.DeadStores]
           agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_inode_buf.c:52:2: note: Value stored to 'agno' is neve=
r read
           agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (8 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   fs/xfs/libxfs/xfs_rmap.c:244:2: warning: 4th function call argument is a=
n uninitialized value [clang-analyzer-core.CallAndMessage]
           xfs_warn(mp,
           ^
   fs/xfs/libxfs/xfs_rmap.c:2677:9: note: Assuming the condition is false
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                  ^
   fs/xfs/libxfs/xfs_format.h:1433:43: note: expanded from macro 'XFS_RMAP_=
NON_INODE_OWNER'
   #define XFS_RMAP_NON_INODE_OWNER(owner) (!!((owner) & (1ULL << 63)))
                                             ^
   fs/xfs/xfs_linux.h:214:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ~~~~~~~^~~~~
   include/linux/compiler.h:77:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   fs/xfs/libxfs/xfs_rmap.c:2677:41: note: Left side of '||' is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
                                                  ^
   fs/xfs/libxfs/xfs_rmap.c:2677:2: note: '?' condition is true
           ASSERT(XFS_RMAP_NON_INODE_OWNER(owner) ||
           ^
   fs/xfs/xfs_linux.h:214:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : asswarn(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:77:20: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                           ^
   fs/xfs/libxfs/xfs_rmap.c:2682:6: note: Assuming 'error' is 0
           if (error)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:2682:2: note: Taking false branch
           if (error)
           ^
   fs/xfs/libxfs/xfs_rmap.c:2684:6: note: Assuming 'has_record' is not equa=
l to 0
           if (!has_record) {
               ^~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:2684:2: note: Taking false branch
           if (!has_record) {
           ^
   fs/xfs/libxfs/xfs_rmap.c:2689:10: note: Calling 'xfs_rmap_get_rec'
           error =3D xfs_rmap_get_rec(cur, &irec, &has_record);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Assuming 'error' is 0
           if (error || !*stat)
               ^~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:6: note: Left side of '||' is false
   fs/xfs/libxfs/xfs_rmap.c:209:15: note: Assuming the condition is false
           if (error || !*stat)
                        ^~~~~~
   fs/xfs/libxfs/xfs_rmap.c:209:2: note: Taking false branch
           if (error || !*stat)
           ^
   fs/xfs/libxfs/xfs_rmap.c:212:6: note: Calling 'xfs_rmap_btrec_to_irec'
           if (xfs_rmap_btrec_to_irec(rec, irec))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:190:9: note: Calling 'xfs_rmap_irec_offset_unpa=
ck'
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_rmap.h:70:6: note: Assuming the condition is true
           if (offset & ~(XFS_RMAP_OFF_MASK | XFS_RMAP_OFF_FLAGS))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.h:70:2: note: Taking true branch
           if (offset & ~(XFS_RMAP_OFF_MASK | XFS_RMAP_OFF_FLAGS))
           ^
   fs/xfs/libxfs/xfs_rmap.h:71:3: note: Returning without writing to 'irec-=
>rm_flags'
                   return -EFSCORRUPTED;
                   ^
   fs/xfs/libxfs/xfs_rmap.h:71:3: note: Returning the value -117, which par=
ticipates in a condition later
                   return -EFSCORRUPTED;
                   ^~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:190:9: note: Returning from 'xfs_rmap_irec_offs=
et_unpack'
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_rmap.c:190:2: note: Returning without writing to 'irec=
->rm_flags'
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
           ^
   fs/xfs/libxfs/xfs_rmap.c:190:2: note: Returning the value -117, which pa=
rticipates in a condition later
           return xfs_rmap_irec_offset_unpack(be64_to_cpu(rec->rmap.rm_offs=
et),
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/xfs/libxfs/xfs_rmap.c:212:6: note: Returning from 'xfs_rmap_btrec_to_=
irec'
           if (xfs_rmap_btrec_to_irec(rec, irec))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/libxfs/xfs_rmap.c:212:2: note: Taking true branch
           if (xfs_rmap_btrec_to_irec(rec, irec))
           ^
   fs/xfs/libxfs/xfs_rmap.c:213:3: note: Control jumps to line 241

vim +/agno +52 fs/xfs/libxfs/xfs_inode_buf.c

f0e28280629e0e fs/xfs/libxfs/xfs_inode_buf.c Jeff Layton       2017-12-11  =
23  =

d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
24  /*
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
25   * If we are doing readahead on an inode buffer, we might be in log rec=
overy
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
26   * reading an inode allocation buffer that hasn't yet been replayed, an=
d hence
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
27   * has not had the inode cores stamped into it. Hence for readahead, th=
e buffer
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
28   * may be potentially invalid.
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
29   *
b79f4a1c68bb99 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
30   * If the readahead buffer is invalid, we need to mark it with an error=
 and
b79f4a1c68bb99 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
31   * clear the DONE status of the buffer so that a followup read will re-=
read it
b79f4a1c68bb99 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
32   * from disk. We don't report the error otherwise to avoid warnings dur=
ing log
06734e3c95a34e fs/xfs/libxfs/xfs_inode_buf.c Keyur Patel       2020-06-29  =
33   * recovery and we don't get unnecessary panics on debug kernels. We us=
e EIO here
b79f4a1c68bb99 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
34   * because all we want to do is say readahead failed; there is no-one t=
o report
b79f4a1c68bb99 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
35   * the error to, so this will distinguish it from a non-ra verifier fai=
lure.
06734e3c95a34e fs/xfs/libxfs/xfs_inode_buf.c Keyur Patel       2020-06-29  =
36   * Changes to this readahead error behaviour also need to be reflected =
in
7d6a13f023567d fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
37   * xfs_dquot_buf_readahead_verify().
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
38   */
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
39  static void
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
40  xfs_inode_buf_verify(
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
41  	struct xfs_buf	*bp,
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
42  	bool		readahead)
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
43  {
dbd329f1e44ed4 fs/xfs/libxfs/xfs_inode_buf.c Christoph Hellwig 2019-06-28  =
44  	struct xfs_mount *mp =3D bp->b_mount;
6a96c5650568a2 fs/xfs/libxfs/xfs_inode_buf.c Darrick J. Wong   2018-03-23  =
45  	xfs_agnumber_t	agno;
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
46  	int		i;
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
47  	int		ni;
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
48  =

1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
49  	/*
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
50  	 * Validate the magic number and version of every inode in the buffer
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
51  	 */
04fcad80cd0687 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2021-08-18 @=
52  	agno =3D xfs_daddr_to_agno(mp, xfs_buf_daddr(bp));
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
53  	ni =3D XFS_BB_TO_FSB(mp, bp->b_length) * mp->m_sb.sb_inopblock;
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
54  	for (i =3D 0; i < ni; i++) {
de38db7239c4bd fs/xfs/libxfs/xfs_inode_buf.c Christoph Hellwig 2021-10-11  =
55  		struct xfs_dinode	*dip;
6a96c5650568a2 fs/xfs/libxfs/xfs_inode_buf.c Darrick J. Wong   2018-03-23  =
56  		xfs_agino_t		unlinked_ino;
de38db7239c4bd fs/xfs/libxfs/xfs_inode_buf.c Christoph Hellwig 2021-10-11  =
57  		int			di_ok;
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
58  =

88ee2df7f25911 fs/xfs/libxfs/xfs_inode_buf.c Christoph Hellwig 2015-06-22  =
59  		dip =3D xfs_buf_offset(bp, (i << mp->m_sb.sb_inodelog));
6a96c5650568a2 fs/xfs/libxfs/xfs_inode_buf.c Darrick J. Wong   2018-03-23  =
60  		unlinked_ino =3D be32_to_cpu(dip->di_next_unlinked);
15baadf72cedc2 fs/xfs/libxfs/xfs_inode_buf.c Darrick J. Wong   2019-02-16  =
61  		di_ok =3D xfs_verify_magic16(bp, dip->di_magic) &&
cf28e17c9186c8 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2021-08-18  =
62  			xfs_dinode_good_version(mp, dip->di_version) &&
1970e03e85e3d4 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2021-12-03  =
63  			xfs_verify_agino_or_null(bp->b_pag, unlinked_ino);
1fd7115eda5661 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-12  =
64  		if (unlikely(XFS_TEST_ERROR(!di_ok, mp,
9e24cfd044853e fs/xfs/libxfs/xfs_inode_buf.c Darrick J. Wong   2017-06-20  =
65  						XFS_ERRTAG_ITOBP_INOTOBP))) {
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
66  			if (readahead) {
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
67  				bp->b_flags &=3D ~XBF_DONE;
b79f4a1c68bb99 fs/xfs/libxfs/xfs_inode_buf.c Dave Chinner      2016-01-12  =
68  				xfs_buf_ioerror(bp, -EIO);
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
69  				return;
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
70  			}
d8914002a03913 fs/xfs/xfs_inode_buf.c        Dave Chinner      2013-08-27  =
71  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3086896616333782212==--

