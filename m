Content-Type: multipart/mixed; boundary="===============2180763680899795893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 3/3] ext4: support flex_bg in ext4_mb_normalize_request
Date: Sun, 29 May 2022 13:26:41 +0800
Message-ID: <202205291323.QpmoZoIc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2180763680899795893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220528110017.354175-4-libaokun1@huawei.com>
References: <20220528110017.354175-4-libaokun1@huawei.com>
TO: Baokun Li <libaokun1@huawei.com>
TO: linux-ext4(a)vger.kernel.org
CC: tytso(a)mit.edu
CC: adilger.kernel(a)dilger.ca
CC: jack(a)suse.cz
CC: ritesh.list(a)gmail.com
CC: lczerner(a)redhat.com
CC: linux-kernel(a)vger.kernel.org
CC: yi.zhang(a)huawei.com
CC: yebin10(a)huawei.com
CC: yukuai3(a)huawei.com
CC: libaokun1(a)huawei.com

Hi Baokun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tytso-ext4/dev]
[also build test WARNING on linus/master v5.18 next-20220527]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Baokun-Li/ext4-fix-t=
wo-bugs-in-ext4_mb_normalize_request/20220528-184745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
529/202205291323.QpmoZoIc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/24640234aaeae85de0c=
1b9eadec0fa29eee5927a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Baokun-Li/ext4-fix-two-bugs-in-ext=
4_mb_normalize_request/20220528-184745
        git checkout 24640234aaeae85de0c1b9eadec0fa29eee5927a
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   fs/ext4/mballoc.c:1295:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(grinfo->bb_counters, 0,
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1295:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(grinfo->bb_counters, 0,
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1303:4: warning: Call to function 'memset' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memset_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(data, 0xff, blocksize);
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1303:4: note: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11
                           memset(data, 0xff, blocksize);
                           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1316:4: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memcpy(data, bitmap, blocksize);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:1316:4: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                           memcpy(data, bitmap, blocksize);
                           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:2612:27: warning: Value stored to 'grp' during its ini=
tialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct ext4_group_info *grp =3D ext4_get_group_info(sb, =
group);
                                           ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ext4/mballoc.c:2612:27: note: Value stored to 'grp' during its initia=
lization is never read
                   struct ext4_group_info *grp =3D ext4_get_group_info(sb, =
group);
                                           ^~~   ~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   fs/ext4/mballoc.c:2891:2: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sg, ext4_get_group_info(sb, group), i);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:2891:2: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
           memcpy(&sg, ext4_get_group_info(sb, group), i);
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:3103:3: warning: Call to function 'memcpy' is insecure=
 as it does not provide security checks introduced in the C11 standard. Rep=
lace with analogous functions that support length arguments or provides bou=
ndary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.ins=
ecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(new_groupinfo, old_groupinfo,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:3103:3: note: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11
                   memcpy(new_groupinfo, old_groupinfo,
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:3994:2: warning: 1st function call argument is an unin=
itialized value [clang-analyzer-core.CallAndMessage]
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
   fs/ext4/mballoc.c:3899:9: note: 'err' declared without an initial value
           int i, err;
                  ^~~
   fs/ext4/mballoc.c:3903:9: note: Assuming 'len' is <=3D 0
           while (len > 0) {
                  ^~~~~~~
   fs/ext4/mballoc.c:3903:2: note: Loop condition is false. Execution conti=
nues on line 3994
           while (len > 0) {
           ^
   fs/ext4/mballoc.c:3994:2: note: 1st function call argument is an uniniti=
alized value
           if (err)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^                    ~~~~
>> fs/ext4/mballoc.c:4119:21: warning: Division by zero [clang-analyzer-cor=
e.DivideZero]
           start =3D max(start, rounddown(ac->ac_o_ex.fe_logical, bpg));
                              ^
   include/linux/math.h:76:13: note: expanded from macro 'rounddown'
           __x - (__x % (y));                              \
                      ^
   include/linux/minmax.h:52:36: note: expanded from macro 'max'
   #define max(x, y)       __careful_cmp(x, y, >)
                           ~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:38:17: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:32:25: note: expanded from macro '__cmp_once'
                   typeof(y) unique_y =3D (y);               \
                                         ^
   fs/ext4/mballoc.c:4037:6: note: Assuming the condition is false
           if (!(ac->ac_flags & EXT4_MB_HINT_DATA))
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/mballoc.c:4037:2: note: '?' condition is false
           if (!(ac->ac_flags & EXT4_MB_HINT_DATA))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/mballoc.c:4037:2: note: '?' condition is false
           if (!(ac->ac_flags & EXT4_MB_HINT_DATA))
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
   fs/ext4/mballoc.c:4037:2: note: Taking false branch
           if (!(ac->ac_flags & EXT4_MB_HINT_DATA))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/mballoc.c:4041:6: note: Assuming the condition is true
           if (unlikely(ac->ac_flags & EXT4_MB_HINT_GOAL_ONLY))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/mballoc.c:4041:2: note: '?' condition is false
           if (unlikely(ac->ac_flags & EXT4_MB_HINT_GOAL_ONLY))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/mballoc.c:4041:2: note: '?' condition is false
           if (unlikely(ac->ac_flags & EXT4_MB_HINT_GOAL_ONLY))
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
   fs/ext4/mballoc.c:4041:2: note: Taking false branch
           if (unlikely(ac->ac_flags & EXT4_MB_HINT_GOAL_ONLY))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/mballoc.c:4046:2: note: Assuming the condition is true
           if (ac->ac_flags & EXT4_MB_HINT_NOPREALLOC)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))

vim +4119 fs/ext4/mballoc.c

c9de560ded61fa Alex Tomas       2008-01-29  4016  =

c9de560ded61fa Alex Tomas       2008-01-29  4017  /*
c9de560ded61fa Alex Tomas       2008-01-29  4018   * Normalization means ma=
king request better in terms of
c9de560ded61fa Alex Tomas       2008-01-29  4019   * size and alignment
c9de560ded61fa Alex Tomas       2008-01-29  4020   */
4ddfef7b41aebb Eric Sandeen     2008-04-29  4021  static noinline_for_stack=
 void
4ddfef7b41aebb Eric Sandeen     2008-04-29  4022  ext4_mb_normalize_request=
(struct ext4_allocation_context *ac,
c9de560ded61fa Alex Tomas       2008-01-29  4023  				struct ext4_allocatio=
n_request *ar)
c9de560ded61fa Alex Tomas       2008-01-29  4024  {
53accfa9f819c8 Theodore Ts'o    2011-09-09  4025  	struct ext4_sb_info *sbi=
 =3D EXT4_SB(ac->ac_sb);
c9de560ded61fa Alex Tomas       2008-01-29  4026  	int bsbits, max;
c9de560ded61fa Alex Tomas       2008-01-29  4027  	ext4_lblk_t end;
1592d2c5574eda Curt Wohlgemuth  2012-02-20  4028  	loff_t size, start_off;
1592d2c5574eda Curt Wohlgemuth  2012-02-20  4029  	loff_t orig_size __maybe=
_unused;
5a0790c2c4a184 Andi Kleen       2010-06-14  4030  	ext4_lblk_t start;
24640234aaeae8 Baokun Li        2022-05-28  4031  	ext4_lblk_t bpg;
c9de560ded61fa Alex Tomas       2008-01-29  4032  	struct ext4_inode_info *=
ei =3D EXT4_I(ac->ac_inode);
9a0762c5af40e4 Aneesh Kumar K.V 2008-04-17  4033  	struct ext4_prealloc_spa=
ce *pa;
c9de560ded61fa Alex Tomas       2008-01-29  4034  =

c9de560ded61fa Alex Tomas       2008-01-29  4035  	/* do normalize only dat=
a requests, metadata requests
c9de560ded61fa Alex Tomas       2008-01-29  4036  	   do not need prealloca=
tion */
c9de560ded61fa Alex Tomas       2008-01-29  4037  	if (!(ac->ac_flags & EXT=
4_MB_HINT_DATA))
c9de560ded61fa Alex Tomas       2008-01-29  4038  		return;
c9de560ded61fa Alex Tomas       2008-01-29  4039  =

c9de560ded61fa Alex Tomas       2008-01-29  4040  	/* sometime caller may w=
ant exact blocks */
c9de560ded61fa Alex Tomas       2008-01-29  4041  	if (unlikely(ac->ac_flag=
s & EXT4_MB_HINT_GOAL_ONLY))
c9de560ded61fa Alex Tomas       2008-01-29  4042  		return;
c9de560ded61fa Alex Tomas       2008-01-29  4043  =

c9de560ded61fa Alex Tomas       2008-01-29  4044  	/* caller may indicate t=
hat preallocation isn't
c9de560ded61fa Alex Tomas       2008-01-29  4045  	 * required (it's a tail=
, for example) */
c9de560ded61fa Alex Tomas       2008-01-29  4046  	if (ac->ac_flags & EXT4_=
MB_HINT_NOPREALLOC)
c9de560ded61fa Alex Tomas       2008-01-29  4047  		return;
c9de560ded61fa Alex Tomas       2008-01-29  4048  =

c9de560ded61fa Alex Tomas       2008-01-29  4049  	if (ac->ac_flags & EXT4_=
MB_HINT_GROUP_ALLOC) {
c9de560ded61fa Alex Tomas       2008-01-29  4050  		ext4_mb_normalize_group=
_request(ac);
c9de560ded61fa Alex Tomas       2008-01-29  4051  		return ;
c9de560ded61fa Alex Tomas       2008-01-29  4052  	}
c9de560ded61fa Alex Tomas       2008-01-29  4053  =

c9de560ded61fa Alex Tomas       2008-01-29  4054  	bsbits =3D ac->ac_sb->s_=
blocksize_bits;
24640234aaeae8 Baokun Li        2022-05-28  4055  	bpg =3D EXT4_BLOCKS_PER_=
GROUP(ac->ac_sb);
24640234aaeae8 Baokun Li        2022-05-28  4056  	if (ext4_has_feature_fle=
x_bg(ac->ac_sb) && sbi->s_log_groups_per_flex) {
24640234aaeae8 Baokun Li        2022-05-28  4057  		if (check_shl_overflow(=
bpg, sbi->s_log_groups_per_flex, &bpg))
24640234aaeae8 Baokun Li        2022-05-28  4058  			bpg =3D EXT_MAX_BLOCKS;
24640234aaeae8 Baokun Li        2022-05-28  4059  	}
c9de560ded61fa Alex Tomas       2008-01-29  4060  =

c9de560ded61fa Alex Tomas       2008-01-29  4061  	/* first, let's learn ac=
tual file size
c9de560ded61fa Alex Tomas       2008-01-29  4062  	 * given current request=
 is allocated */
53accfa9f819c8 Theodore Ts'o    2011-09-09  4063  	size =3D ac->ac_o_ex.fe_=
logical + EXT4_C2B(sbi, ac->ac_o_ex.fe_len);
c9de560ded61fa Alex Tomas       2008-01-29  4064  	size =3D size << bsbits;
c9de560ded61fa Alex Tomas       2008-01-29  4065  	if (size < i_size_read(a=
c->ac_inode))
c9de560ded61fa Alex Tomas       2008-01-29  4066  		size =3D i_size_read(ac=
->ac_inode);
5a0790c2c4a184 Andi Kleen       2010-06-14  4067  	orig_size =3D size;
c9de560ded61fa Alex Tomas       2008-01-29  4068  =

1930479c4b6bbc Valerie Clement  2008-05-13  4069  	/* max size of free chun=
ks */
1930479c4b6bbc Valerie Clement  2008-05-13  4070  	max =3D 2 << bsbits;
c9de560ded61fa Alex Tomas       2008-01-29  4071  =

1930479c4b6bbc Valerie Clement  2008-05-13  4072  #define NRL_CHECK_SIZE(re=
q, size, max, chunk_size)	\
1930479c4b6bbc Valerie Clement  2008-05-13  4073  		(req <=3D (size) || max=
 <=3D (chunk_size))
c9de560ded61fa Alex Tomas       2008-01-29  4074  =

c9de560ded61fa Alex Tomas       2008-01-29  4075  	/* first, try to predict=
 filesize */
c9de560ded61fa Alex Tomas       2008-01-29  4076  	/* XXX: should this tabl=
e be tunable? */
c9de560ded61fa Alex Tomas       2008-01-29  4077  	start_off =3D 0;
c9de560ded61fa Alex Tomas       2008-01-29  4078  	if (size <=3D 16 * 1024)=
 {
c9de560ded61fa Alex Tomas       2008-01-29  4079  		size =3D 16 * 1024;
c9de560ded61fa Alex Tomas       2008-01-29  4080  	} else if (size <=3D 32 =
* 1024) {
c9de560ded61fa Alex Tomas       2008-01-29  4081  		size =3D 32 * 1024;
c9de560ded61fa Alex Tomas       2008-01-29  4082  	} else if (size <=3D 64 =
* 1024) {
c9de560ded61fa Alex Tomas       2008-01-29  4083  		size =3D 64 * 1024;
c9de560ded61fa Alex Tomas       2008-01-29  4084  	} else if (size <=3D 128=
 * 1024) {
c9de560ded61fa Alex Tomas       2008-01-29  4085  		size =3D 128 * 1024;
c9de560ded61fa Alex Tomas       2008-01-29  4086  	} else if (size <=3D 256=
 * 1024) {
c9de560ded61fa Alex Tomas       2008-01-29  4087  		size =3D 256 * 1024;
c9de560ded61fa Alex Tomas       2008-01-29  4088  	} else if (size <=3D 512=
 * 1024) {
c9de560ded61fa Alex Tomas       2008-01-29  4089  		size =3D 512 * 1024;
c9de560ded61fa Alex Tomas       2008-01-29  4090  	} else if (size <=3D 102=
4 * 1024) {
c9de560ded61fa Alex Tomas       2008-01-29  4091  		size =3D 1024 * 1024;
1930479c4b6bbc Valerie Clement  2008-05-13  4092  	} else if (NRL_CHECK_SIZ=
E(size, 4 * 1024 * 1024, max, 2 * 1024)) {
c9de560ded61fa Alex Tomas       2008-01-29  4093  		start_off =3D ((loff_t)=
ac->ac_o_ex.fe_logical >>
1930479c4b6bbc Valerie Clement  2008-05-13  4094  						(21 - bsbits)) << 2=
1;
1930479c4b6bbc Valerie Clement  2008-05-13  4095  		size =3D 2 * 1024 * 102=
4;
1930479c4b6bbc Valerie Clement  2008-05-13  4096  	} else if (NRL_CHECK_SIZ=
E(size, 8 * 1024 * 1024, max, 4 * 1024)) {
c9de560ded61fa Alex Tomas       2008-01-29  4097  		start_off =3D ((loff_t)=
ac->ac_o_ex.fe_logical >>
c9de560ded61fa Alex Tomas       2008-01-29  4098  							(22 - bsbits)) << =
22;
c9de560ded61fa Alex Tomas       2008-01-29  4099  		size =3D 4 * 1024 * 102=
4;
c9de560ded61fa Alex Tomas       2008-01-29  4100  	} else if (NRL_CHECK_SIZ=
E(ac->ac_o_ex.fe_len,
1930479c4b6bbc Valerie Clement  2008-05-13  4101  					(8<<20)>>bsbits, max=
, 8 * 1024)) {
c9de560ded61fa Alex Tomas       2008-01-29  4102  		start_off =3D ((loff_t)=
ac->ac_o_ex.fe_logical >>
c9de560ded61fa Alex Tomas       2008-01-29  4103  							(23 - bsbits)) << =
23;
c9de560ded61fa Alex Tomas       2008-01-29  4104  		size =3D 8 * 1024 * 102=
4;
c9de560ded61fa Alex Tomas       2008-01-29  4105  	} else {
c9de560ded61fa Alex Tomas       2008-01-29  4106  		start_off =3D (loff_t) =
ac->ac_o_ex.fe_logical << bsbits;
b27b1535acc0e9 Xiaoguang Wang   2014-07-27  4107  		size	  =3D (loff_t) EXT=
4_C2B(EXT4_SB(ac->ac_sb),
b27b1535acc0e9 Xiaoguang Wang   2014-07-27  4108  					      ac->ac_o_ex.fe=
_len) << bsbits;
c9de560ded61fa Alex Tomas       2008-01-29  4109  	}
5a0790c2c4a184 Andi Kleen       2010-06-14  4110  	size =3D size >> bsbits;
5a0790c2c4a184 Andi Kleen       2010-06-14  4111  	start =3D start_off >> b=
sbits;
c9de560ded61fa Alex Tomas       2008-01-29  4112  =

b0c3a326d0bc0b Baokun Li        2022-05-28  4113  	/*
b0c3a326d0bc0b Baokun Li        2022-05-28  4114  	 * For tiny groups (smal=
ler than 8MB) the chosen allocation
b0c3a326d0bc0b Baokun Li        2022-05-28  4115  	 * alignment may be larg=
er than group size. Make sure the
b0c3a326d0bc0b Baokun Li        2022-05-28  4116  	 * alignment does not mo=
ve allocation to a different group which
b0c3a326d0bc0b Baokun Li        2022-05-28  4117  	 * makes mballoc fail as=
sertions later.
b0c3a326d0bc0b Baokun Li        2022-05-28  4118  	 */
24640234aaeae8 Baokun Li        2022-05-28 @4119  	start =3D max(start, rou=
nddown(ac->ac_o_ex.fe_logical, bpg));
b0c3a326d0bc0b Baokun Li        2022-05-28  4120  =

c9de560ded61fa Alex Tomas       2008-01-29  4121  	/* don't cover already a=
llocated blocks in selected range */
c9de560ded61fa Alex Tomas       2008-01-29  4122  	if (ar->pleft && start <=
=3D ar->lleft) {
c9de560ded61fa Alex Tomas       2008-01-29  4123  		size -=3D ar->lleft + 1=
 - start;
c9de560ded61fa Alex Tomas       2008-01-29  4124  		start =3D ar->lleft + 1;
c9de560ded61fa Alex Tomas       2008-01-29  4125  	}
c9de560ded61fa Alex Tomas       2008-01-29  4126  	if (ar->pright && start =
+ size - 1 >=3D ar->lright)
c9de560ded61fa Alex Tomas       2008-01-29  4127  		size -=3D start + size =
- ar->lright;
c9de560ded61fa Alex Tomas       2008-01-29  4128  =

cd648b8a8fd507 Jan Kara         2017-01-27  4129  	/*
cd648b8a8fd507 Jan Kara         2017-01-27  4130  	 * Trim allocation reque=
st for filesystems with artificially small
cd648b8a8fd507 Jan Kara         2017-01-27  4131  	 * groups.
cd648b8a8fd507 Jan Kara         2017-01-27  4132  	 */
24640234aaeae8 Baokun Li        2022-05-28  4133  	if (size > bpg)
24640234aaeae8 Baokun Li        2022-05-28  4134  		size =3D bpg;
cd648b8a8fd507 Jan Kara         2017-01-27  4135  =

c9de560ded61fa Alex Tomas       2008-01-29  4136  	end =3D start + size;
c9de560ded61fa Alex Tomas       2008-01-29  4137  =

c9de560ded61fa Alex Tomas       2008-01-29  4138  	/* check we don't cross =
already preallocated blocks */
c9de560ded61fa Alex Tomas       2008-01-29  4139  	rcu_read_lock();
9a0762c5af40e4 Aneesh Kumar K.V 2008-04-17  4140  	list_for_each_entry_rcu(=
pa, &ei->i_prealloc_list, pa_inode_list) {
498e5f24158da7 Theodore Ts'o    2008-11-05  4141  		ext4_lblk_t pa_end;
c9de560ded61fa Alex Tomas       2008-01-29  4142  =

c9de560ded61fa Alex Tomas       2008-01-29  4143  		if (pa->pa_deleted)
c9de560ded61fa Alex Tomas       2008-01-29  4144  			continue;
c9de560ded61fa Alex Tomas       2008-01-29  4145  		spin_lock(&pa->pa_lock);
c9de560ded61fa Alex Tomas       2008-01-29  4146  		if (pa->pa_deleted) {
c9de560ded61fa Alex Tomas       2008-01-29  4147  			spin_unlock(&pa->pa_lo=
ck);
c9de560ded61fa Alex Tomas       2008-01-29  4148  			continue;
c9de560ded61fa Alex Tomas       2008-01-29  4149  		}
c9de560ded61fa Alex Tomas       2008-01-29  4150  =

53accfa9f819c8 Theodore Ts'o    2011-09-09  4151  		pa_end =3D pa->pa_lstar=
t + EXT4_C2B(EXT4_SB(ac->ac_sb),
53accfa9f819c8 Theodore Ts'o    2011-09-09  4152  						  pa->pa_len);
c9de560ded61fa Alex Tomas       2008-01-29  4153  =

c9de560ded61fa Alex Tomas       2008-01-29  4154  		/* PA must not overlap =
original request */
c9de560ded61fa Alex Tomas       2008-01-29  4155  		BUG_ON(!(ac->ac_o_ex.fe=
_logical >=3D pa_end ||
c9de560ded61fa Alex Tomas       2008-01-29  4156  			ac->ac_o_ex.fe_logical=
 < pa->pa_lstart));
c9de560ded61fa Alex Tomas       2008-01-29  4157  =

38877f4e8dbbec Eric Sandeen     2009-08-17  4158  		/* skip PAs this normal=
ized request doesn't overlap with */
38877f4e8dbbec Eric Sandeen     2009-08-17  4159  		if (pa->pa_lstart >=3D =
end || pa_end <=3D start) {
c9de560ded61fa Alex Tomas       2008-01-29  4160  			spin_unlock(&pa->pa_lo=
ck);
c9de560ded61fa Alex Tomas       2008-01-29  4161  			continue;
c9de560ded61fa Alex Tomas       2008-01-29  4162  		}
c9de560ded61fa Alex Tomas       2008-01-29  4163  		BUG_ON(pa->pa_lstart <=
=3D start && pa_end >=3D end);
c9de560ded61fa Alex Tomas       2008-01-29  4164  =

38877f4e8dbbec Eric Sandeen     2009-08-17  4165  		/* adjust start or end =
to be adjacent to this pa */
c9de560ded61fa Alex Tomas       2008-01-29  4166  		if (pa_end <=3D ac->ac_=
o_ex.fe_logical) {
c9de560ded61fa Alex Tomas       2008-01-29  4167  			BUG_ON(pa_end < start);
c9de560ded61fa Alex Tomas       2008-01-29  4168  			start =3D pa_end;
38877f4e8dbbec Eric Sandeen     2009-08-17  4169  		} else if (pa->pa_lstar=
t > ac->ac_o_ex.fe_logical) {
c9de560ded61fa Alex Tomas       2008-01-29  4170  			BUG_ON(pa->pa_lstart >=
 end);
c9de560ded61fa Alex Tomas       2008-01-29  4171  			end =3D pa->pa_lstart;
c9de560ded61fa Alex Tomas       2008-01-29  4172  		}
c9de560ded61fa Alex Tomas       2008-01-29  4173  		spin_unlock(&pa->pa_loc=
k);
c9de560ded61fa Alex Tomas       2008-01-29  4174  	}
c9de560ded61fa Alex Tomas       2008-01-29  4175  	rcu_read_unlock();
c9de560ded61fa Alex Tomas       2008-01-29  4176  	size =3D end - start;
c9de560ded61fa Alex Tomas       2008-01-29  4177  =

c9de560ded61fa Alex Tomas       2008-01-29  4178  	/* XXX: extra loop to ch=
eck we really don't overlap preallocations */
c9de560ded61fa Alex Tomas       2008-01-29  4179  	rcu_read_lock();
9a0762c5af40e4 Aneesh Kumar K.V 2008-04-17  4180  	list_for_each_entry_rcu(=
pa, &ei->i_prealloc_list, pa_inode_list) {
498e5f24158da7 Theodore Ts'o    2008-11-05  4181  		ext4_lblk_t pa_end;
53accfa9f819c8 Theodore Ts'o    2011-09-09  4182  =

c9de560ded61fa Alex Tomas       2008-01-29  4183  		spin_lock(&pa->pa_lock);
c9de560ded61fa Alex Tomas       2008-01-29  4184  		if (pa->pa_deleted =3D=
=3D 0) {
53accfa9f819c8 Theodore Ts'o    2011-09-09  4185  			pa_end =3D pa->pa_lsta=
rt + EXT4_C2B(EXT4_SB(ac->ac_sb),
53accfa9f819c8 Theodore Ts'o    2011-09-09  4186  							  pa->pa_len);
c9de560ded61fa Alex Tomas       2008-01-29  4187  			BUG_ON(!(start >=3D pa=
_end || end <=3D pa->pa_lstart));
c9de560ded61fa Alex Tomas       2008-01-29  4188  		}
c9de560ded61fa Alex Tomas       2008-01-29  4189  		spin_unlock(&pa->pa_loc=
k);
c9de560ded61fa Alex Tomas       2008-01-29  4190  	}
c9de560ded61fa Alex Tomas       2008-01-29  4191  	rcu_read_unlock();
c9de560ded61fa Alex Tomas       2008-01-29  4192  =

7354605bc16dc1 Baokun Li        2022-05-28  4193  	/*
7354605bc16dc1 Baokun Li        2022-05-28  4194  	 * In this function "sta=
rt" and "size" are normalized for better
7354605bc16dc1 Baokun Li        2022-05-28  4195  	 * alignment and length =
such that we could preallocate more blocks.
7354605bc16dc1 Baokun Li        2022-05-28  4196  	 * This normalization is=
 done such that original request of
7354605bc16dc1 Baokun Li        2022-05-28  4197  	 * ac->ac_o_ex.fe_logica=
l & fe_len should always lie within "start" and
7354605bc16dc1 Baokun Li        2022-05-28  4198  	 * "size" boundaries.
7354605bc16dc1 Baokun Li        2022-05-28  4199  	 * (Note fe_len can be r=
elaxed since FS block allocation API does not
7354605bc16dc1 Baokun Li        2022-05-28  4200  	 * provide gurantee on n=
umber of contiguous blocks allocation since that
7354605bc16dc1 Baokun Li        2022-05-28  4201  	 * depends upon free spa=
ce left, etc).
7354605bc16dc1 Baokun Li        2022-05-28  4202  	 * In case of inode pa, =
later we use the allocated blocks
7354605bc16dc1 Baokun Li        2022-05-28  4203  	 * [pa_start + fe_logica=
l - pa_lstart, fe_len/size] from the preallocated
7354605bc16dc1 Baokun Li        2022-05-28  4204  	 * range of goal/best bl=
ocks [start, size] to put it at the
7354605bc16dc1 Baokun Li        2022-05-28  4205  	 * ac_o_ex.fe_logical ex=
tent of this inode.
7354605bc16dc1 Baokun Li        2022-05-28  4206  	 * (See ext4_mb_use_inod=
e_pa() for more details)
7354605bc16dc1 Baokun Li        2022-05-28  4207  	 */
7354605bc16dc1 Baokun Li        2022-05-28  4208  	if (start + size <=3D ac=
->ac_o_ex.fe_logical ||
c9de560ded61fa Alex Tomas       2008-01-29  4209  			start > ac->ac_o_ex.fe=
_logical) {
9d8b9ec44234b2 Theodore Ts'o    2011-08-01  4210  		ext4_msg(ac->ac_sb, KER=
N_ERR,
9d8b9ec44234b2 Theodore Ts'o    2011-08-01  4211  			 "start %lu, size %lu,=
 fe_logical %lu",
c9de560ded61fa Alex Tomas       2008-01-29  4212  			 (unsigned long) start=
, (unsigned long) size,
c9de560ded61fa Alex Tomas       2008-01-29  4213  			 (unsigned long) ac->a=
c_o_ex.fe_logical);
dfe076c106f63c Dmitry Monakhov  2014-10-01  4214  		BUG();
c9de560ded61fa Alex Tomas       2008-01-29  4215  	}
24640234aaeae8 Baokun Li        2022-05-28  4216  	BUG_ON(size <=3D 0 || si=
ze > bpg);
c9de560ded61fa Alex Tomas       2008-01-29  4217  =

c9de560ded61fa Alex Tomas       2008-01-29  4218  	/* now prepare goal requ=
est */
c9de560ded61fa Alex Tomas       2008-01-29  4219  =

c9de560ded61fa Alex Tomas       2008-01-29  4220  	/* XXX: is it better to =
align blocks WRT to logical
c9de560ded61fa Alex Tomas       2008-01-29  4221  	 * placement or satisfy =
big request as is */
c9de560ded61fa Alex Tomas       2008-01-29  4222  	ac->ac_g_ex.fe_logical =
=3D start;
53accfa9f819c8 Theodore Ts'o    2011-09-09  4223  	ac->ac_g_ex.fe_len =3D E=
XT4_NUM_B2C(sbi, size);
c9de560ded61fa Alex Tomas       2008-01-29  4224  =

c9de560ded61fa Alex Tomas       2008-01-29  4225  	/* define goal start in =
order to merge */
c9de560ded61fa Alex Tomas       2008-01-29  4226  	if (ar->pright && (ar->l=
right =3D=3D (start + size))) {
c9de560ded61fa Alex Tomas       2008-01-29  4227  		/* merge to the right */
c9de560ded61fa Alex Tomas       2008-01-29  4228  		ext4_get_group_no_and_o=
ffset(ac->ac_sb, ar->pright - size,
c9de560ded61fa Alex Tomas       2008-01-29  4229  						&ac->ac_f_ex.fe_gro=
up,
c9de560ded61fa Alex Tomas       2008-01-29  4230  						&ac->ac_f_ex.fe_sta=
rt);
c9de560ded61fa Alex Tomas       2008-01-29  4231  		ac->ac_flags |=3D EXT4_=
MB_HINT_TRY_GOAL;
c9de560ded61fa Alex Tomas       2008-01-29  4232  	}
c9de560ded61fa Alex Tomas       2008-01-29  4233  	if (ar->pleft && (ar->ll=
eft + 1 =3D=3D start)) {
c9de560ded61fa Alex Tomas       2008-01-29  4234  		/* merge to the left */
c9de560ded61fa Alex Tomas       2008-01-29  4235  		ext4_get_group_no_and_o=
ffset(ac->ac_sb, ar->pleft + 1,
c9de560ded61fa Alex Tomas       2008-01-29  4236  						&ac->ac_f_ex.fe_gro=
up,
c9de560ded61fa Alex Tomas       2008-01-29  4237  						&ac->ac_f_ex.fe_sta=
rt);
c9de560ded61fa Alex Tomas       2008-01-29  4238  		ac->ac_flags |=3D EXT4_=
MB_HINT_TRY_GOAL;
c9de560ded61fa Alex Tomas       2008-01-29  4239  	}
c9de560ded61fa Alex Tomas       2008-01-29  4240  =

d3df14535f4a5b Ritesh Harjani   2020-05-10  4241  	mb_debug(ac->ac_sb, "goa=
l: %lld(was %lld) blocks at %u\n", size,
d3df14535f4a5b Ritesh Harjani   2020-05-10  4242  		 orig_size, start);
c9de560ded61fa Alex Tomas       2008-01-29  4243  }
c9de560ded61fa Alex Tomas       2008-01-29  4244  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2180763680899795893==--

