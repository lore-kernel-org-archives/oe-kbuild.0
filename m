Content-Type: multipart/mixed; boundary="===============7079118745253549552=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/intel/ice/ice_lag.c:65:17: warning: Value stored to 'dev' during its initialization is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 01 Dec 2021 18:42:13 +0800
Message-ID: <202112011827.5ZjEmHQJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7079118745253549552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Dave Ertman <david.m.ertman@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: df006dd4b1dca8c486f73ae76fb77c06afae83f2 ice: Add initial support f=
ramework for LAG
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-c002-20211126 (https://download.01.org/0day-ci/archi=
ve/20211201/202112011827.5ZjEmHQJ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddf006dd4b1dca8c486f73ae76fb77c06afae83f2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout df006dd4b1dca8c486f73ae76fb77c06afae83f2
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9673:11: note: '?' condition =
is false
                   acaps =3D be32_to_cpu(cmd.u.info32.acaps32);
                           ^
   include/linux/byteorder/generic.h:95:21: note: expanded from macro 'be32=
_to_cpu'
   #define be32_to_cpu __be32_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:40:26: note: expanded from =
macro '__be32_to_cpu'
   #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
                            ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9676:8: note: Calling 't4_all=
oc_vi'
           ret =3D t4_alloc_vi(pi->adapter, mbox, port, pf, vf, 1, mac, &rs=
s_size,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:7638:16: note: '?' condition =
is false
           c.op_to_vfn =3D cpu_to_be32(FW_CMD_OP_V(FW_VI_CMD) | FW_CMD_REQU=
EST_F |
                         ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:7641:21: note: '?' condition =
is true
           c.alloc_to_len16 =3D cpu_to_be32(FW_VI_CMD_ALLOC_F | FW_LEN16(c)=
);
                              ^
   include/linux/byteorder/generic.h:94:21: note: expanded from macro 'cpu_=
to_be32'
   #define cpu_to_be32 __cpu_to_be32
                       ^
   include/uapi/linux/byteorder/little_endian.h:39:43: note: expanded from =
macro '__cpu_to_be32'
   #define __cpu_to_be32(x) ((__force __be32)__swab32((x)))
                                             ^
   include/uapi/linux/swab.h:118:3: note: expanded from macro '__swab32'
           (__builtin_constant_p((__u32)(x)) ?     \
            ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:7646:6: note: Assuming 'ret' =
is not equal to 0
           if (ret)
               ^~~
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:7646:2: note: Taking true bra=
nch
           if (ret)
           ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:7647:3: note: Returning witho=
ut writing to '*rss_size'
                   return ret;
                   ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9676:8: note: Returning from =
't4_alloc_vi'
           ret =3D t4_alloc_vi(pi->adapter, mbox, port, pf, vf, 1, mac, &rs=
s_size,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9678:6: note: Assuming 'ret' =
is >=3D 0
           if (ret < 0)
               ^~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9678:2: note: Taking false br=
anch
           if (ret < 0)
           ^
   drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9684:15: note: Assigned value=
 is garbage or undefined
           pi->rss_size =3D rss_size;
                        ^ ~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:1816:3: warning: Value store=
d to 'protocol' is never read [clang-analyzer-deadcode.DeadStores]
                   protocol =3D vhdr->h_vlan_encapsulated_proto;
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/iavf/iavf_txrx.c:1816:3: note: Value stored t=
o 'protocol' is never read
                   protocol =3D vhdr->h_vlan_encapsulated_proto;
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/net/ethernet/intel/ice/ice_fw_update.c:366:17: warning: Value st=
ored to 'dev' during its initialization is never read [clang-analyzer-deadc=
ode.DeadStores]
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_fw_update.c:366:17: note: Value store=
d to 'dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(pf);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   20 warnings generated.
>> drivers/net/ethernet/intel/ice/ice_lag.c:65:17: warning: Value stored to=
 'dev' during its initialization is never read [clang-analyzer-deadcode.Dea=
dStores]
           struct device *dev =3D &lag->pf->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:65:17: note: Value stored to 'd=
ev' during its initialization is never read
           struct device *dev =3D &lag->pf->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:67:2: warning: Value stored to =
'name' is never read [clang-analyzer-deadcode.DeadStores]
           name =3D lag->netdev ? netdev_name(lag->netdev) : "unset";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:67:2: note: Value stored to 'na=
me' is never read
           name =3D lag->netdev ? netdev_name(lag->netdev) : "unset";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:68:2: warning: Value stored to =
'peer' is never read [clang-analyzer-deadcode.DeadStores]
           peer =3D lag->peer_netdev ? netdev_name(lag->peer_netdev) : "uns=
et";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:68:2: note: Value stored to 'pe=
er' is never read
           peer =3D lag->peer_netdev ? netdev_name(lag->peer_netdev) : "uns=
et";
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:69:2: warning: Value stored to =
'upper' is never read [clang-analyzer-deadcode.DeadStores]
           upper =3D lag->upper_netdev ? netdev_name(lag->upper_netdev) : "=
unset";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:69:2: note: Value stored to 'up=
per' is never read
           upper =3D lag->upper_netdev ? netdev_name(lag->upper_netdev) : "=
unset";
           ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:70:2: warning: Value stored to =
'master' is never read [clang-analyzer-deadcode.DeadStores]
           master =3D lag->master ? "TRUE" : "FALSE";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:70:2: note: Value stored to 'ma=
ster' is never read
           master =3D lag->master ? "TRUE" : "FALSE";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:71:2: warning: Value stored to =
'bonded' is never read [clang-analyzer-deadcode.DeadStores]
           bonded =3D lag->bonded ? "BONDED" : "UNBONDED";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:71:2: note: Value stored to 'bo=
nded' is never read
           bonded =3D lag->bonded ? "BONDED" : "UNBONDED";
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/intel/ice/ice_lag.c:75:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "NONE";
                   ^      ~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:75:3: note: Value stored to 'ro=
le' is never read
                   role =3D "NONE";
                   ^      ~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:78:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "PRIMARY";
                   ^      ~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:78:3: note: Value stored to 'ro=
le' is never read
                   role =3D "PRIMARY";
                   ^      ~~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:81:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "BACKUP";
                   ^      ~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:81:3: note: Value stored to 'ro=
le' is never read
                   role =3D "BACKUP";
                   ^      ~~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:84:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "UNSET";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:84:3: note: Value stored to 'ro=
le' is never read
                   role =3D "UNSET";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:87:3: warning: Value stored to =
'role' is never read [clang-analyzer-deadcode.DeadStores]
                   role =3D "ERROR";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:87:3: note: Value stored to 'ro=
le' is never read
                   role =3D "ERROR";
                   ^      ~~~~~~~
   drivers/net/ethernet/intel/ice/ice_lag.c:356:17: warning: Value stored t=
o 'dev' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct device *dev =3D ice_pf_to_dev(lag->pf);
                          ^~~
   drivers/net/ethernet/intel/ice/ice_lag.c:356:17: note: Value stored to '=
dev' during its initialization is never read
           struct device *dev =3D ice_pf_to_dev(lag->pf);
                          ^~~
   Suppressed 8 warnings (8 in non-user code).
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
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:1579:4: warning: Valu=
e stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                           ret =3D kstrtouint(end, 10, &j);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:1579:4: note: Value s=
tored to 'ret' is never read
                           ret =3D kstrtouint(end, 10, &j);
                           ^     ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2216:9: warning: Arra=
y subscript is undefined [clang-analyzer-core.uninitialized.ArraySubscript]
                           if (!isxdigit(*p))
                                ^
   include/linux/ctype.h:35:23: note: expanded from macro 'isxdigit'
   #define isxdigit(c)     ((__ismask(c)&(_D|_X)) !=3D 0)
                             ^~~~~~~~~~~
   include/linux/ctype.h:23:22: note: expanded from macro '__ismask'
   #define __ismask(x) (_ctype[(int)(unsigned char)(x)])
                        ^      ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2205:6: note: Assumin=
g the condition is false
           if (count > sizeof(s) - 1)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2205:2: note: Taking =
false branch
           if (count > sizeof(s) - 1)
           ^
   drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c:2207:6: note: Calling=
 'copy_from_user'
           if (copy_from_user(s, buf, count))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:33: note: Assuming the condition is false
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
                                          ^
   include/linux/compiler.h:45:22: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'
   #define __branch_check__(x, expect, is_constant) ({                     \
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:2: note: Taking false branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0, which particip=
ates in a condition later
           if (unlikely(res))
               ^
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \

vim +/dev +65 drivers/net/ethernet/intel/ice/ice_lag.c

df006dd4b1dca8 Dave Ertman 2020-11-20  57  =

df006dd4b1dca8 Dave Ertman 2020-11-20  58  /**
df006dd4b1dca8 Dave Ertman 2020-11-20  59   * ice_display_lag_info - print =
LAG info
df006dd4b1dca8 Dave Ertman 2020-11-20  60   * @lag: LAG info struct
df006dd4b1dca8 Dave Ertman 2020-11-20  61   */
df006dd4b1dca8 Dave Ertman 2020-11-20  62  static void ice_display_lag_info=
(struct ice_lag *lag)
df006dd4b1dca8 Dave Ertman 2020-11-20  63  {
df006dd4b1dca8 Dave Ertman 2020-11-20  64  	const char *name, *peer, *upper=
, *role, *bonded, *master;
df006dd4b1dca8 Dave Ertman 2020-11-20 @65  	struct device *dev =3D &lag->pf=
->pdev->dev;
df006dd4b1dca8 Dave Ertman 2020-11-20  66  =

df006dd4b1dca8 Dave Ertman 2020-11-20 @67  	name =3D lag->netdev ? netdev_n=
ame(lag->netdev) : "unset";
df006dd4b1dca8 Dave Ertman 2020-11-20 @68  	peer =3D lag->peer_netdev ? net=
dev_name(lag->peer_netdev) : "unset";
df006dd4b1dca8 Dave Ertman 2020-11-20 @69  	upper =3D lag->upper_netdev ? n=
etdev_name(lag->upper_netdev) : "unset";
df006dd4b1dca8 Dave Ertman 2020-11-20 @70  	master =3D lag->master ? "TRUE"=
 : "FALSE";
df006dd4b1dca8 Dave Ertman 2020-11-20 @71  	bonded =3D lag->bonded ? "BONDE=
D" : "UNBONDED";
df006dd4b1dca8 Dave Ertman 2020-11-20  72  =

df006dd4b1dca8 Dave Ertman 2020-11-20  73  	switch (lag->role) {
df006dd4b1dca8 Dave Ertman 2020-11-20  74  	case ICE_LAG_NONE:
df006dd4b1dca8 Dave Ertman 2020-11-20 @75  		role =3D "NONE";
df006dd4b1dca8 Dave Ertman 2020-11-20  76  		break;
df006dd4b1dca8 Dave Ertman 2020-11-20  77  	case ICE_LAG_PRIMARY:
df006dd4b1dca8 Dave Ertman 2020-11-20  78  		role =3D "PRIMARY";
df006dd4b1dca8 Dave Ertman 2020-11-20  79  		break;
df006dd4b1dca8 Dave Ertman 2020-11-20  80  	case ICE_LAG_BACKUP:
df006dd4b1dca8 Dave Ertman 2020-11-20  81  		role =3D "BACKUP";
df006dd4b1dca8 Dave Ertman 2020-11-20  82  		break;
df006dd4b1dca8 Dave Ertman 2020-11-20  83  	case ICE_LAG_UNSET:
df006dd4b1dca8 Dave Ertman 2020-11-20  84  		role =3D "UNSET";
df006dd4b1dca8 Dave Ertman 2020-11-20  85  		break;
df006dd4b1dca8 Dave Ertman 2020-11-20  86  	default:
df006dd4b1dca8 Dave Ertman 2020-11-20  87  		role =3D "ERROR";
df006dd4b1dca8 Dave Ertman 2020-11-20  88  	}
df006dd4b1dca8 Dave Ertman 2020-11-20  89  =

df006dd4b1dca8 Dave Ertman 2020-11-20  90  	dev_dbg(dev, "%s %s, peer:%s, u=
pper:%s, role:%s, master:%s\n", name,
df006dd4b1dca8 Dave Ertman 2020-11-20  91  		bonded, peer, upper, role, mas=
ter);
df006dd4b1dca8 Dave Ertman 2020-11-20  92  }
df006dd4b1dca8 Dave Ertman 2020-11-20  93  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7079118745253549552==--

