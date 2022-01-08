Content-Type: multipart/mixed; boundary="===============8629862188502694229=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC V1 net-next 2/4] net: Expose available time stamping layers to user space.
Date: Sun, 09 Jan 2022 05:19:27 +0800
Message-ID: <202201090507.DjVyQPOP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8629862188502694229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220103232555.19791-3-richardcochran@gmail.com>
References: <20220103232555.19791-3-richardcochran@gmail.com>
TO: Richard Cochran <richardcochran@gmail.com>

Hi Richard,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Richard-Cochran/Make-MAC-P=
HY-time-stamping-selectable/20220104-072717
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
3d694552fd8fe502e7ffd22ffa0e085bfd73b19a
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007-20220105 (https://download.01.org/0day-ci/ar=
chive/20220109/202201090507.DjVyQPOP-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e3=
0ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c7ffd872b92c08c5ffdb864da=
31410adb78f6a17
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Richard-Cochran/Make-MAC-PHY-time-=
stamping-selectable/20220104-072717
        git checkout c7ffd872b92c08c5ffdb864da31410adb78f6a17
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   sound/soc/sof/pcm.c:505:2: warning: Value stored to 'dai' is never read =
[clang-analyzer-deadcode.DeadStores]
           dai =3D bytes_to_frames(substream->runtime,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/sof/pcm.c:505:2: note: Value stored to 'dai' is never read
           dai =3D bytes_to_frames(substream->runtime,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   sound/soc/bcm/bcm63xx-pcm-whistler.c:263:31: warning: The left operand o=
f '+' is a garbage value [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:234:59: note: 'val_1' declared with=
out an initial value
           unsigned int availdepth, ifflevel, offlevel, int_status, val_1, =
val_2;
                                                                    ^~~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:249:2: note: Assuming the condition=
 is false
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   sound/soc/bcm/bcm63xx-pcm-whistler.c:249:2: note: '?' condition is false
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:249:2: note: '?' condition is true
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
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
   sound/soc/bcm/bcm63xx-pcm-whistler.c:249:2: note: Taking true branch
           if (int_status & I2S_RX_DESC_OFF_INTR_EN_MSK) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:258:3: note: Loop condition is fals=
e. Execution continues on line 263
                   while (offlevel) {
                   ^
   sound/soc/bcm/bcm63xx-pcm-whistler.c:263:31: note: The left operand of '=
+' is a garbage value
                   prtd->dma_addr_next =3D val_1 + val_2;
                                         ~~~~~ ^
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> net/core/net-sysfs.c:632:2: warning: Value stored to 'ops' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:632:2: note: Value stored to 'ops' is never read
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
>> net/core/net-sysfs.c:642:3: warning: Value stored to 'buf' is never read=
 [clang-analyzer-deadcode.DeadStores]
                   buf +=3D 4;
                   ^      ~
   net/core/net-sysfs.c:642:3: note: Value stored to 'buf' is never read
                   buf +=3D 4;
                   ^      ~
   net/core/net-sysfs.c:662:2: warning: Value stored to 'ops' is never read=
 [clang-analyzer-deadcode.DeadStores]
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:662:2: note: Value stored to 'ops' is never read
           ops =3D netdev->ethtool_ops;
           ^     ~~~~~~~~~~~~~~~~~~~
   net/core/net-sysfs.c:1829:2: warning: Value stored to 'txq' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           txq =3D real_tx;
           ^     ~~~~~~~
   net/core/net-sysfs.c:1829:2: note: Value stored to 'txq' is never read
           txq =3D real_tx;
           ^     ~~~~~~~
   Suppressed 10 warnings (8 in non-user code, 2 with check filters).
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
   57 warnings generated.
   Suppressed 57 warnings (57 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   net/core/drop_monitor.c:870:2: warning: 1st function call argument is an=
 uninitialized value [clang-analyzer-core.CallAndMessage]
           kfree(hw_metadata->fa_cookie);
           ^
   net/core/drop_monitor.c:941:6: note: Assuming field 'trap_type' is not e=
qual to DEVLINK_TRAP_TYPE_CONTROL
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   net/core/drop_monitor.c:941:2: note: '?' condition is false
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/drop_monitor.c:941:16: note: Field 'trap_type' is not equal to =
DEVLINK_TRAP_TYPE_CONTROL
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
                         ^
   net/core/drop_monitor.c:941:2: note: '?' condition is false
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
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
   net/core/drop_monitor.c:941:2: note: Taking false branch
           if (metadata->trap_type =3D=3D DEVLINK_TRAP_TYPE_CONTROL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/drop_monitor.c:944:2: note: '?' condition is false
           if (!skb_mac_header_was_set(skb))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   net/core/drop_monitor.c:944:2: note: '?' condition is false
           if (!skb_mac_header_was_set(skb))
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
   net/core/drop_monitor.c:944:2: note: Taking false branch
           if (!skb_mac_header_was_set(skb))
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   net/core/drop_monitor.c:948:6: note: Assuming 'nskb' is non-null
           if (!nskb)

vim +/ops +632 net/core/net-sysfs.c

5fdd2f0e5c6484 Wei Wang        2021-02-08  620  =

c7ffd872b92c08 Richard Cochran 2022-01-03  621  static ssize_t available_ti=
mestamping_providers_show(struct device *dev,
c7ffd872b92c08 Richard Cochran 2022-01-03  622  						     struct device_at=
tribute *attr,
c7ffd872b92c08 Richard Cochran 2022-01-03  623  						     char *buf)
c7ffd872b92c08 Richard Cochran 2022-01-03  624  {
c7ffd872b92c08 Richard Cochran 2022-01-03  625  	const struct ethtool_ops *=
ops;
c7ffd872b92c08 Richard Cochran 2022-01-03  626  	struct net_device *netdev;
c7ffd872b92c08 Richard Cochran 2022-01-03  627  	struct phy_device *phydev;
c7ffd872b92c08 Richard Cochran 2022-01-03  628  	int ret =3D 0;
c7ffd872b92c08 Richard Cochran 2022-01-03  629  =

c7ffd872b92c08 Richard Cochran 2022-01-03  630  	netdev =3D to_net_dev(dev);
c7ffd872b92c08 Richard Cochran 2022-01-03  631  	phydev =3D netdev->phydev;
c7ffd872b92c08 Richard Cochran 2022-01-03 @632  	ops =3D netdev->ethtool_op=
s;
c7ffd872b92c08 Richard Cochran 2022-01-03  633  =

c7ffd872b92c08 Richard Cochran 2022-01-03  634  	if (!rtnl_trylock())
c7ffd872b92c08 Richard Cochran 2022-01-03  635  		return restart_syscall();
c7ffd872b92c08 Richard Cochran 2022-01-03  636  =

c7ffd872b92c08 Richard Cochran 2022-01-03  637  	ret +=3D sprintf(buf, "%s\=
n", "mac");
c7ffd872b92c08 Richard Cochran 2022-01-03  638  	buf +=3D 4;
c7ffd872b92c08 Richard Cochran 2022-01-03  639  =

c7ffd872b92c08 Richard Cochran 2022-01-03  640  	if (phy_has_tsinfo(phydev)=
) {
c7ffd872b92c08 Richard Cochran 2022-01-03  641  		ret +=3D sprintf(buf, "%s=
\n", "phy");
c7ffd872b92c08 Richard Cochran 2022-01-03 @642  		buf +=3D 4;
c7ffd872b92c08 Richard Cochran 2022-01-03  643  	}
c7ffd872b92c08 Richard Cochran 2022-01-03  644  =

c7ffd872b92c08 Richard Cochran 2022-01-03  645  	rtnl_unlock();
c7ffd872b92c08 Richard Cochran 2022-01-03  646  =

c7ffd872b92c08 Richard Cochran 2022-01-03  647  	return ret;
c7ffd872b92c08 Richard Cochran 2022-01-03  648  }
c7ffd872b92c08 Richard Cochran 2022-01-03  649  static DEVICE_ATTR_RO(avail=
able_timestamping_providers);
c7ffd872b92c08 Richard Cochran 2022-01-03  650  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8629862188502694229==--

