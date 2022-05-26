Content-Type: multipart/mixed; boundary="===============7211585953278329645=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/tpm/tpm_tis_core.c:422:10: warning: The left expression of the compound assignment is an uninitialized value. The computed value will also be garbage [clang-analyzer-core.uninitialized.Assign]
Date: Thu, 26 May 2022 20:49:24 +0800
Message-ID: <202205262048.bQEvMIZ8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7211585953278329645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Holland <johannes.holland@infineon.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   babf0bb978e3c9fce6c4eba6b744c8754fd43d8e
commit: 6422cbd3c52deb1d53a0e60c271f34d882ca8a9d tpm: Remove read16/read32/=
write32 calls from tpm_tis_phy_ops
date:   3 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
526/202205262048.bQEvMIZ8-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e=
75b0c402c7f3b42a2b1b2873f151220947)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6422cbd3c52deb1d53a0e60c271f34d882ca8a9d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6422cbd3c52deb1d53a0e60c271f34d882ca8a9d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/tpm/tpm_tis_core.h:160:2: note: '?' condition is false
           if (!rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.h:160:7: note: 'rc' is not equal to 0
           if (!rc)
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
   drivers/char/tpm/tpm_tis_core.h:160:2: note: '?' condition is false
           if (!rc)
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
   drivers/char/tpm/tpm_tis_core.h:160:2: note: Taking false branch
           if (!rc)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.h:163:2: note: Returning without writing t=
o '*result'
           return rc;
           ^
   drivers/char/tpm/tpm_tis_core.c:245:8: note: Returning from 'tpm_tis_rea=
d32'
                   rc =3D tpm_tis_read32(priv, TPM_STS(priv->locality), &va=
lue);
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/char/tpm/tpm_tis_core.c:246:7: note: Assuming 'rc' is >=3D 0
                   if (rc < 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/tpm/tpm_tis_core.c:246:3: note: '?' condition is false
                   if (rc < 0)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.c:246:7: note: 'rc' is >=3D 0
                   if (rc < 0)
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
   drivers/char/tpm/tpm_tis_core.c:246:3: note: '?' condition is false
                   if (rc < 0)
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
   drivers/char/tpm/tpm_tis_core.c:246:3: note: Taking false branch
                   if (rc < 0)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.c:249:21: note: The left operand of '>>' i=
s a garbage value
                   burstcnt =3D (value >> 8) & 0xFFFF;
                               ~~~~~ ^
>> drivers/char/tpm/tpm_tis_core.c:422:10: warning: The left expression of =
the compound assignment is an uninitialized value. The computed value will =
also be garbage [clang-analyzer-core.uninitialized.Assign]
           intmask &=3D ~TPM_GLOBAL_INT_ENABLE;
                   ^
   drivers/char/tpm/tpm_tis_core.c:473:6: note: Assuming the condition is f=
alse
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/tpm/tpm_tis_core.c:473:6: note: Left side of '||' is false
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
               ^
   drivers/char/tpm/tpm_tis_core.c:473:2: note: Assuming the condition is t=
rue
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/tpm/tpm_tis_core.c:473:2: note: '?' condition is false
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.c:473:6: note: Left side of '||' is false
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
               ^
   drivers/char/tpm/tpm_tis_core.c:473:2: note: '?' condition is false
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
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
   drivers/char/tpm/tpm_tis_core.c:473:2: note: Taking false branch
           if (!(chip->flags & TPM_CHIP_FLAG_IRQ) || priv->irq_tested)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.c:483:2: note: '?' condition is false
           if (!priv->irq_tested)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.c:483:13: note: Field 'irq_tested' is false
           if (!priv->irq_tested)
                      ^
   drivers/char/tpm/tpm_tis_core.c:483:2: note: '?' condition is true
           if (!priv->irq_tested)
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
   drivers/char/tpm/tpm_tis_core.c:483:2: note: Taking true branch
           if (!priv->irq_tested)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.c:485:2: note: '?' condition is false
           if (!priv->irq_tested)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.c:485:13: note: Field 'irq_tested' is false
           if (!priv->irq_tested)
                      ^
   drivers/char/tpm/tpm_tis_core.c:485:2: note: '?' condition is true
           if (!priv->irq_tested)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
--
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/tpm/tpm_tis_core.h:160:2: note: '?' condition is false
           if (!rc)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.h:160:7: note: 'rc' is not equal to 0
           if (!rc)
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
   drivers/char/tpm/tpm_tis_core.h:160:2: note: '?' condition is false
           if (!rc)
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
   drivers/char/tpm/tpm_tis_core.h:160:2: note: Taking false branch
           if (!rc)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.h:163:2: note: Returning without writing t=
o '*result'
           return rc;
           ^
   drivers/char/tpm/tpm_tis_core.c:841:7: note: Returning from 'tpm_tis_rea=
d32'
           rc =3D tpm_tis_read32(priv, reg, &interrupt);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:842:6: note: Assuming 'rc' is >=3D 0
           if (rc < 0)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/char/tpm/tpm_tis_core.c:842:2: note: '?' condition is false
           if (rc < 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.c:842:6: note: 'rc' is >=3D 0
           if (rc < 0)
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
   drivers/char/tpm/tpm_tis_core.c:842:2: note: '?' condition is false
           if (rc < 0)
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
   drivers/char/tpm/tpm_tis_core.c:842:2: note: Taking false branch
           if (rc < 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.c:845:52: note: The right operand of '&' i=
s a garbage value
           tpm_tis_write32(priv, reg, ~TPM_GLOBAL_INT_ENABLE & interrupt);
                                                             ^ ~~~~~~~~~
>> drivers/char/tpm/tpm_tis_core.c:959:24: warning: Assigned value is garba=
ge or undefined [clang-analyzer-core.uninitialized.Assign]
           priv->manufacturer_id =3D vendor;
                                 ^ ~~~~~~
   drivers/char/tpm/tpm_tis_core.c:926:2: note: 'vendor' declared without a=
n initial value
           u32 vendor;
           ^~~~~~~~~~
   drivers/char/tpm/tpm_tis_core.c:935:2: note: '?' condition is false
           if (IS_ERR(chip))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/char/tpm/tpm_tis_core.c:935:2: note: '?' condition is false
           if (IS_ERR(chip))
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
   drivers/char/tpm/tpm_tis_core.c:935:2: note: Taking false branch
           if (IS_ERR(chip))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/tpm/tpm_tis_core.c:945:37: note: TIS_SHORT_TIMEOUT is <=3D =
TPM2_TIMEOUT_A
           chip->timeout_a =3D msecs_to_jiffies(TIS_TIMEOUT_A_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:64:27: note: expanded from macro 'TIS_TI=
MEOUT_A_MAX'
   #define TIS_TIMEOUT_A_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_A)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:945:37: note: '?' condition is false
           chip->timeout_a =3D msecs_to_jiffies(TIS_TIMEOUT_A_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:64:27: note: expanded from macro 'TIS_TI=
MEOUT_A_MAX'
   #define TIS_TIMEOUT_A_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_A)
                                   ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:946:37: note: TIS_LONG_TIMEOUT is <=3D T=
PM2_TIMEOUT_B
           chip->timeout_b =3D msecs_to_jiffies(TIS_TIMEOUT_B_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:65:27: note: expanded from macro 'TIS_TI=
MEOUT_B_MAX'
   #define TIS_TIMEOUT_B_MAX       max_t(int, TIS_LONG_TIMEOUT, TPM2_TIMEOU=
T_B)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~
   drivers/char/tpm/tpm_tis_core.c:946:37: note: '?' condition is false
           chip->timeout_b =3D msecs_to_jiffies(TIS_TIMEOUT_B_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:65:27: note: expanded from macro 'TIS_TI=
MEOUT_B_MAX'
   #define TIS_TIMEOUT_B_MAX       max_t(int, TIS_LONG_TIMEOUT, TPM2_TIMEOU=
T_B)
                                   ^
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)
                                   ^
   include/linux/minmax.h:37:3: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   drivers/char/tpm/tpm_tis_core.c:947:37: note: TIS_SHORT_TIMEOUT is > TPM=
2_TIMEOUT_C
           chip->timeout_c =3D msecs_to_jiffies(TIS_TIMEOUT_C_MAX);
                                              ^
   drivers/char/tpm/tpm_tis_core.h:66:27: note: expanded from macro 'TIS_TI=
MEOUT_C_MAX'
   #define TIS_TIMEOUT_C_MAX       max_t(int, TIS_SHORT_TIMEOUT, TPM2_TIMEO=
UT_C)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   include/linux/minmax.h:112:27: note: expanded from macro 'max_t'
   #define max_t(type, x, y)       __careful_cmp((type)(x), (type)(y), >)

vim +422 drivers/char/tpm/tpm_tis_core.c

41a5e1cf1fe151e Christophe Ricard 2016-05-19  408  =

41a5e1cf1fe151e Christophe Ricard 2016-05-19  409  static void disable_inte=
rrupts(struct tpm_chip *chip)
41a5e1cf1fe151e Christophe Ricard 2016-05-19  410  {
41a5e1cf1fe151e Christophe Ricard 2016-05-19  411  	struct tpm_tis_data *pr=
iv =3D dev_get_drvdata(&chip->dev);
41a5e1cf1fe151e Christophe Ricard 2016-05-19  412  	u32 intmask;
41a5e1cf1fe151e Christophe Ricard 2016-05-19  413  	int rc;
41a5e1cf1fe151e Christophe Ricard 2016-05-19  414  =

b160c94be5d2816 Jarkko Sakkinen   2020-04-12  415  	if (priv->irq =3D=3D 0)
b160c94be5d2816 Jarkko Sakkinen   2020-04-12  416  		return;
b160c94be5d2816 Jarkko Sakkinen   2020-04-12  417  =

41a5e1cf1fe151e Christophe Ricard 2016-05-19  418  	rc =3D tpm_tis_read32(p=
riv, TPM_INT_ENABLE(priv->locality), &intmask);
41a5e1cf1fe151e Christophe Ricard 2016-05-19  419  	if (rc < 0)
41a5e1cf1fe151e Christophe Ricard 2016-05-19  420  		intmask =3D 0;
41a5e1cf1fe151e Christophe Ricard 2016-05-19  421  =

41a5e1cf1fe151e Christophe Ricard 2016-05-19 @422  	intmask &=3D ~TPM_GLOBA=
L_INT_ENABLE;
41a5e1cf1fe151e Christophe Ricard 2016-05-19  423  	rc =3D tpm_tis_write32(=
priv, TPM_INT_ENABLE(priv->locality), intmask);
41a5e1cf1fe151e Christophe Ricard 2016-05-19  424  =

41a5e1cf1fe151e Christophe Ricard 2016-05-19  425  	devm_free_irq(chip->dev=
.parent, priv->irq, chip);
41a5e1cf1fe151e Christophe Ricard 2016-05-19  426  	priv->irq =3D 0;
41a5e1cf1fe151e Christophe Ricard 2016-05-19  427  	chip->flags &=3D ~TPM_C=
HIP_FLAG_IRQ;
41a5e1cf1fe151e Christophe Ricard 2016-05-19  428  }
41a5e1cf1fe151e Christophe Ricard 2016-05-19  429  =


:::::: The code at line 422 was first introduced by commit
:::::: 41a5e1cf1fe151ed48b4b3106c748d03a85133ce tpm/tpm_tis: Split tpm_tis =
driver into a core and TCG TIS compliant phy

:::::: TO: Christophe Ricard <christophe.ricard@gmail.com>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7211585953278329645==--

