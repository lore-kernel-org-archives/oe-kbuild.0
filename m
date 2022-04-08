Content-Type: multipart/mixed; boundary="===============7159630283474772644=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] w1: Fix warning on module removal
Date: Fri, 08 Apr 2022 23:02:47 +0800
Message-ID: <202204082223.4Kn7NaeV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7159630283474772644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220408031849.897248-1-zheyuma97@gmail.com>
References: <20220408031849.897248-1-zheyuma97@gmail.com>
TO: Zheyu Ma <zheyuma97@gmail.com>
TO: zbr(a)ioremap.net
CC: linux-kernel(a)vger.kernel.org
CC: Zheyu Ma <zheyuma97@gmail.com>

Hi Zheyu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on linux/master v5.18-rc1 next-20220408]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zheyu-Ma/w1-Fix-warn=
ing-on-module-removal/20220408-112108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
42e7a03d3badebd4e70aea5362d6914dfc7c220b
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
408/202204082223.4Kn7NaeV-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51=
b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9bfdffbf234145d0e21=
1a6f37bfda74e2cb290ea
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zheyu-Ma/w1-Fix-warning-on-module-=
removal/20220408-112108
        git checkout 9bfdffbf234145d0e211a6f37bfda74e2cb290ea
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^~~~~~~
   drivers/w1/w1.c:363:10: note: Call to function 'sprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'sprintf_s' in case of C11
           count =3D sprintf(buf, "%d\n", md->slave_count);
                   ^~~~~~~
   drivers/w1/w1.c:381:8: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   c -=3D snprintf(buf + PAGE_SIZE - c, c, "%s\n", sl->name=
);
                        ^~~~~~~~
   drivers/w1/w1.c:381:8: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
                   c -=3D snprintf(buf + PAGE_SIZE - c, c, "%s\n", sl->name=
);
                        ^~~~~~~~
   drivers/w1/w1.c:384:8: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   c -=3D snprintf(buf + PAGE_SIZE - c, c, "not found.\n");
                        ^~~~~~~~
   drivers/w1/w1.c:384:8: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
                   c -=3D snprintf(buf + PAGE_SIZE - c, c, "not found.\n");
                        ^~~~~~~~
   drivers/w1/w1.c:395:7: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           c -=3D snprintf(buf+PAGE_SIZE - c, c,
                ^~~~~~~~
   drivers/w1/w1.c:395:7: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
           c -=3D snprintf(buf+PAGE_SIZE - c, c,
                ^~~~~~~~
   drivers/w1/w1.c:420:6: warning: Call to function 'sscanf' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'sscanf_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           i =3D sscanf(buf, "%02x-%012llx", &family, &id);
               ^~~~~~
   drivers/w1/w1.c:420:6: note: Call to function 'sscanf' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'sscanf_s' in case of C11
           i =3D sscanf(buf, "%02x-%012llx", &family, &id);
               ^~~~~~
   drivers/w1/w1.c:492:7: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           c -=3D snprintf(buf+PAGE_SIZE - c, c,
                ^~~~~~~~
   drivers/w1/w1.c:492:7: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
           c -=3D snprintf(buf+PAGE_SIZE - c, c,
                ^~~~~~~~
   drivers/w1/w1.c:689:2: warning: Call to function 'snprintf' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'snprintf_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(&sl->name[0], sizeof(sl->name),
           ^~~~~~~~
   drivers/w1/w1.c:689:2: note: Call to function 'snprintf' is insecure as =
it does not provide security checks introduced in the C11 standard. Replace=
 with analogous functions that support length arguments or provides boundar=
y checks such as 'snprintf_s' in case of C11
           snprintf(&sl->name[0], sizeof(sl->name),
           ^~~~~~~~
   drivers/w1/w1.c:740:2: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:740:2: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:741:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(&sl->reg_num, rn, sizeof(sl->reg_num));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:741:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(&sl->reg_num, rn, sizeof(sl->reg_num));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:779:2: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(msg.id.id, rn, sizeof(msg.id));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:779:2: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
           memcpy(msg.id.id, rn, sizeof(msg.id));
           ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:800:3: warning: Call to function 'memset' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memset_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&msg, 0, sizeof(msg));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:800:3: note: Call to function 'memset' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memset_s' in case of C11
                   memset(&msg, 0, sizeof(msg));
                   ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'mems=
et'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:801:3: warning: Call to function 'memcpy' is insecure as=
 it does not provide security checks introduced in the C11 standard. Replac=
e with analogous functions that support length arguments or provides bounda=
ry checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.insecu=
reAPI.DeprecatedOrUnsafeBufferHandling]
                   memcpy(msg.id.id, &sl->reg_num, sizeof(msg.id));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
   drivers/w1/w1.c:801:3: note: Call to function 'memcpy' is insecure as it=
 does not provide security checks introduced in the C11 standard. Replace w=
ith analogous functions that support length arguments or provides boundary =
checks such as 'memcpy_s' in case of C11
                   memcpy(msg.id.id, &sl->reg_num, sizeof(msg.id));
                   ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memc=
py'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^~~~~~~~~~~~~~~~
>> drivers/w1/w1.c:821:14: warning: Use of memory after it is freed [clang-=
analyzer-unix.Malloc]
           mutex_lock(&sl->master->list_mutex);
                       ^
   drivers/w1/w1.c:884:2: note: Loop condition is true.  Entering loop body
           list_for_each_entry(dev, &w1_masters, w1_master_entry) {
           ^
   include/linux/list.h:638:2: note: expanded from macro 'list_for_each_ent=
ry'
           for (pos =3D list_first_entry(head, typeof(*pos), member);      =
  \
           ^
   drivers/w1/w1.c:885:3: note: '?' condition is false
                   dev_dbg(&dev->dev, "Reconnecting slaves in device %s "
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/w1/w1.c:885:3: note: '?' condition is false
                   dev_dbg(&dev->dev, "Reconnecting slaves in device %s "
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
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
   drivers/w1/w1.c:885:3: note: Taking false branch
                   dev_dbg(&dev->dev, "Reconnecting slaves in device %s "
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:133:2: note: expanded from macro '__dynami=
c_func_call'
           if (DYNAMIC_DEBUG_BRANCH(id))                   \
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/w1/w1.c:885:3: note: Loop condition is false.  Exiting loop
                   dev_dbg(&dev->dev, "Reconnecting slaves in device %s "
                   ^
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:166:2: note: expanded from macro 'dynamic_=
dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
           ^
   include/linux/dynamic_debug.h:152:2: note: expanded from macro '_dynamic=
_func_call'
           __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS_=
_)
           ^
   include/linux/dynamic_debug.h:131:49: note: expanded from macro '__dynam=
ic_func_call'
   #define __dynamic_func_call(id, fmt, func, ...) do {    \
                                                   ^
   drivers/w1/w1.c:889:3: note: Loop condition is true.  Entering loop body
                   list_for_each_entry_safe(sl, sln, &dev->slist, w1_slave_=
entry) {
                   ^
   include/linux/list.h:725:2: note: expanded from macro 'list_for_each_ent=
ry_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
           ^
   drivers/w1/w1.c:895:9: note: Assuming 'attach' is 0
                           if ((attach && sl->family->fid =3D=3D W1_FAMILY_=
DEFAULT
                                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/w1/w1.c:895:16: note: Left side of '&&' is false

vim +821 drivers/w1/w1.c

9fcbbac5ded489 David Fries    2014-01-15  816  =

9fcbbac5ded489 David Fries    2014-01-15  817  int w1_slave_detach(struct w=
1_slave *sl)
9fcbbac5ded489 David Fries    2014-01-15  818  {
9fcbbac5ded489 David Fries    2014-01-15  819  	/* Only detach a slave once=
 as it decreases the refcnt each time. */
9fcbbac5ded489 David Fries    2014-01-15  820  	int destroy_now;
9fcbbac5ded489 David Fries    2014-01-15 @821  	mutex_lock(&sl->master->lis=
t_mutex);
9fcbbac5ded489 David Fries    2014-01-15  822  	destroy_now =3D !test_bit(W=
1_SLAVE_DETACH, &sl->flags);
9fcbbac5ded489 David Fries    2014-01-15  823  	set_bit(W1_SLAVE_DETACH, &s=
l->flags);
9fcbbac5ded489 David Fries    2014-01-15  824  	mutex_unlock(&sl->master->l=
ist_mutex);
9fcbbac5ded489 David Fries    2014-01-15  825  =

9fcbbac5ded489 David Fries    2014-01-15  826  	if (destroy_now)
9fcbbac5ded489 David Fries    2014-01-15  827  		destroy_now =3D !w1_unref_=
slave(sl);
9fcbbac5ded489 David Fries    2014-01-15  828  	return destroy_now ? 0 : -E=
BUSY;
9fcbbac5ded489 David Fries    2014-01-15  829  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  830  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7159630283474772644==--

