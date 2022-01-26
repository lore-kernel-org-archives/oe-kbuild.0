Content-Type: multipart/mixed; boundary="===============7260919534268743643=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mptcp/ctrl.c:89:3: warning: Argument to kfree() is the address of the global variable 'mptcp_sysctl_table', which is not memory allocated by malloc() [clang-analyzer-unix.Malloc]
Date: Wed, 26 Jan 2022 19:13:37 +0800
Message-ID: <202201261913.99WP2cm3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7260919534268743643==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Pavel Machek <pavel@ucw.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 2cbbe9c50d13b6417e0baf8e8475ed73d4d12c2d leds: lgm-sso: Remove unne=
eded of_match_ptr()
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201261913.99WP2cm3-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D2cbbe9c50d13b6417e0baf8e8475ed73d4d12c2d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2cbbe9c50d13b6417e0baf8e8475ed73d4d12c2d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/most/configfs.c:446:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
   drivers/most/configfs.c:535:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->name, name);
           ^~~~~~
   3 warnings generated.
   fs/cifs/smb2ops.c:4020:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4020:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "R");
                   ^~~~~~
   fs/cifs/smb2ops.c:4024:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4024:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "H");
                   ^~~~~~
   fs/cifs/smb2ops.c:4028:3: warning: Call to function 'strcat' is insecure=
 as it does not provide bounding of the memory buffer. Replace unbounded co=
py functions with analogous functions that support length arguments such as=
 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(message, "W");
                   ^~~~~~
   fs/cifs/smb2ops.c:4028:3: note: Call to function 'strcat' is insecure as=
 it does not provide bounding of the memory buffer. Replace unbounded copy =
functions with analogous functions that support length arguments such as 's=
trlcat'. CWE-119
                   strcat(message, "W");
                   ^~~~~~
   4 warnings generated.
   net/sunrpc/svcauth_unix.c:131:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(new->m_class, item->m_class);
           ^~~~~~
   net/sunrpc/svcauth_unix.c:131:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(new->m_class, item->m_class);
           ^~~~~~
   net/sunrpc/svcauth_unix.c:294:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ip.m_class, class);
           ^~~~~~
   net/sunrpc/svcauth_unix.c:294:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(ip.m_class, class);
           ^~~~~~
   net/sunrpc/svcauth_unix.c:819:29: warning: Although the value stored to =
'len' is used in the enclosing expression, the value is never actually read=
 from 'len' [clang-analyzer-deadcode.DeadStores]
           if (slen > UNX_NGROUPS || (len -=3D (slen + 2)*4) < 0)
                                      ^      ~~~~~~~~~~~~
   net/sunrpc/svcauth_unix.c:819:29: note: Although the value stored to 'le=
n' is used in the enclosing expression, the value is never actually read fr=
om 'len'
           if (slen > UNX_NGROUPS || (len -=3D (slen + 2)*4) < 0)
                                      ^      ~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   net/sunrpc/addr.c:92:2: warning: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(buf, scopebuf);
           ^~~~~~
   net/sunrpc/addr.c:92:2: note: Call to function 'strcat' is insecure as i=
t does not provide bounding of the memory buffer. Replace unbounded copy fu=
nctions with analogous functions that support length arguments such as 'str=
lcat'. CWE-119
           strcat(buf, scopebuf);
           ^~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   net/mptcp/crypto.c:60:12: warning: Assigned value is garbage or undefine=
d [clang-analyzer-core.uninitialized.Assign]
                   input[i] ^=3D key1be[i];
                            ^  ~~~~~~~~~
   net/mptcp/crypto.c:51:19: note: Assuming 'len' is <=3D 32
           if (WARN_ON_ONCE(len > SHA256_DIGEST_SIZE))
                            ^
   include/asm-generic/bug.h:102:25: note: expanded from macro 'WARN_ON_ONC=
E'
           int __ret_warn_on =3D !!(condition);                      \
                                  ^~~~~~~~~
   net/mptcp/crypto.c:51:6: note: Taking false branch
           if (WARN_ON_ONCE(len > SHA256_DIGEST_SIZE))
               ^
   include/asm-generic/bug.h:103:2: note: expanded from macro 'WARN_ON_ONCE'
           if (unlikely(__ret_warn_on))                            \
           ^
   net/mptcp/crypto.c:51:2: note: Taking false branch
           if (WARN_ON_ONCE(len > SHA256_DIGEST_SIZE))
           ^
   net/mptcp/crypto.c:54:2: note: Calling 'put_unaligned_be64'
           put_unaligned_be64(key1, key1be);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/crypto.c:54:2: note: Returning from 'put_unaligned_be64'
           put_unaligned_be64(key1, key1be);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/crypto.c:59:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < 8; i++)
           ^
   net/mptcp/crypto.c:59:21: note: The value 1 is assigned to 'i'
           for (i =3D 0; i < 8; i++)
                              ^~~
   net/mptcp/crypto.c:59:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D 0; i < 8; i++)
           ^
   net/mptcp/crypto.c:60:12: note: Assigned value is garbage or undefined
                   input[i] ^=3D key1be[i];
                            ^  ~~~~~~~~~
   1 warning generated.
>> net/mptcp/ctrl.c:89:3: warning: Argument to kfree() is the address of th=
e global variable 'mptcp_sysctl_table', which is not memory allocated by ma=
lloc() [clang-analyzer-unix.Malloc]
                   kfree(table);
                   ^
   net/mptcp/ctrl.c:109:9: note: Calling 'mptcp_pernet_new_table'
           return mptcp_pernet_new_table(net, pernet);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/ctrl.c:70:6: note: Assuming the condition is false
           if (!net_eq(net, &init_net)) {
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/ctrl.c:70:2: note: Taking false branch
           if (!net_eq(net, &init_net)) {
           ^
   net/mptcp/ctrl.c:80:6: note: Assuming 'hdr' is null
           if (!hdr)
               ^~~~
   net/mptcp/ctrl.c:80:2: note: Taking true branch
           if (!hdr)
           ^
   net/mptcp/ctrl.c:81:3: note: Control jumps to line 88
                   goto err_reg;
                   ^
   net/mptcp/ctrl.c:88:6: note: Assuming the condition is true
           if (!net_eq(net, &init_net))
               ^~~~~~~~~~~~~~~~~~~~~~~
   net/mptcp/ctrl.c:88:2: note: Taking true branch
           if (!net_eq(net, &init_net))
           ^
   net/mptcp/ctrl.c:89:3: note: Argument to kfree() is the address of the g=
lobal variable 'mptcp_sysctl_table', which is not memory allocated by mallo=
c()
                   kfree(table);
                   ^     ~~~~~
   1 warning generated.
   drivers/hid/hid-lg-g15.c:365:3: warning: Value stored to 'ret' is never =
read [clang-analyzer-deadcode.DeadStores]
                   ret =3D (ret < 0) ? ret : -EIO;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-lg-g15.c:365:3: note: Value stored to 'ret' is never read
                   ret =3D (ret < 0) ? ret : -EIO;
                   ^     ~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/hid/hid-magicmouse.c:743:3: warning: Value stored to 'report' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   report =3D hid_register_report(hdev, HID_INPUT_REPORT,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-magicmouse.c:743:3: note: Value stored to 'report' is ne=
ver read
                   report =3D hid_register_report(hdev, HID_INPUT_REPORT,
                   ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
   net/ipv4/ipconfig.c:366:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
           ^~~~~~
   net/ipv4/ipconfig.c:366:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);
           ^~~~~~
   net/ipv4/ipconfig.c:1034:2: warning: Value stored to 'h' is never read [=
clang-analyzer-deadcode.DeadStores]
           h =3D &b->iph;
           ^   ~~~~~~~
   net/ipv4/ipconfig.c:1034:2: note: Value stored to 'h' is never read
           h =3D &b->iph;
           ^   ~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   net/unix/af_unix.c:1505:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   net/unix/af_unix.c:1505:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   net/ipv4/udp.c:728:2: warning: Value stored to 'err' is never read [clan=
g-analyzer-deadcode.DeadStores]
           err =3D 0;
           ^     ~
   net/ipv4/udp.c:728:2: note: Value stored to 'err' is never read
           err =3D 0;
           ^     ~
   1 warning generated.
   drivers/crypto/qat/qat_common/qat_hal.c:1436:2: warning: 6th function ca=
ll argument is an uninitialized value [clang-analyzer-core.CallAndMessage]
           qat_hal_wr_rel_reg(handle, ae, ctx, ICP_GPB_REL, gprnum, gprval);
           ^
   drivers/crypto/qat/qat_common/qat_hal.c:1521:6: note: Assuming 'reg_num'=
 is < ICP_QAT_UCLO_MAX_XFER_REG
           if (reg_num >=3D ICP_QAT_UCLO_MAX_XFER_REG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_hal.c:1521:2: note: Taking false branch
           if (reg_num >=3D ICP_QAT_UCLO_MAX_XFER_REG)
           ^
   drivers/crypto/qat/qat_common/qat_hal.c:1525:7: note: Assuming 'ctx_mask=
' is equal to 0
                   if (ctx_mask =3D=3D 0) {
                       ^~~~~~~~~~~~~
   drivers/crypto/qat/qat_common/qat_hal.c:1525:3: note: Taking true branch
                   if (ctx_mask =3D=3D 0) {
                   ^
   drivers/crypto/qat/qat_common/qat_hal.c:1535:10: note: Calling 'qat_hal_=
put_rel_wr_xfer'
                   stat =3D qat_hal_put_rel_wr_xfer(handle, ae, ctx, type, =
reg,
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   drivers/crypto/qat/qat_common/qat_hal.c:1388:15: note: 'gprval' declared=
 without an initial value
           unsigned int gprval, ctx_enables;
                        ^~~~~~

vim +/mptcp_sysctl_table +89 net/mptcp/ctrl.c

784325e9f037e5f Matthieu Baerts 2020-01-21  63  =

784325e9f037e5f Matthieu Baerts 2020-01-21  64  static int mptcp_pernet_new=
_table(struct net *net, struct mptcp_pernet *pernet)
784325e9f037e5f Matthieu Baerts 2020-01-21  65  {
784325e9f037e5f Matthieu Baerts 2020-01-21  66  	struct ctl_table_header *h=
dr;
784325e9f037e5f Matthieu Baerts 2020-01-21  67  	struct ctl_table *table;
784325e9f037e5f Matthieu Baerts 2020-01-21  68  =

784325e9f037e5f Matthieu Baerts 2020-01-21  69  	table =3D mptcp_sysctl_tab=
le;
784325e9f037e5f Matthieu Baerts 2020-01-21  70  	if (!net_eq(net, &init_net=
)) {
784325e9f037e5f Matthieu Baerts 2020-01-21  71  		table =3D kmemdup(table, =
sizeof(mptcp_sysctl_table), GFP_KERNEL);
784325e9f037e5f Matthieu Baerts 2020-01-21  72  		if (!table)
784325e9f037e5f Matthieu Baerts 2020-01-21  73  			goto err_alloc;
784325e9f037e5f Matthieu Baerts 2020-01-21  74  	}
784325e9f037e5f Matthieu Baerts 2020-01-21  75  =

784325e9f037e5f Matthieu Baerts 2020-01-21  76  	table[0].data =3D &pernet-=
>mptcp_enabled;
93f323b9cccc1fc Geliang Tang    2020-11-03  77  	table[1].data =3D &pernet-=
>add_addr_timeout;
784325e9f037e5f Matthieu Baerts 2020-01-21  78  =

784325e9f037e5f Matthieu Baerts 2020-01-21  79  	hdr =3D register_net_sysct=
l(net, MPTCP_SYSCTL_PATH, table);
784325e9f037e5f Matthieu Baerts 2020-01-21  80  	if (!hdr)
784325e9f037e5f Matthieu Baerts 2020-01-21  81  		goto err_reg;
784325e9f037e5f Matthieu Baerts 2020-01-21  82  =

784325e9f037e5f Matthieu Baerts 2020-01-21  83  	pernet->ctl_table_hdr =3D =
hdr;
784325e9f037e5f Matthieu Baerts 2020-01-21  84  =

784325e9f037e5f Matthieu Baerts 2020-01-21  85  	return 0;
784325e9f037e5f Matthieu Baerts 2020-01-21  86  =

784325e9f037e5f Matthieu Baerts 2020-01-21  87  err_reg:
784325e9f037e5f Matthieu Baerts 2020-01-21  88  	if (!net_eq(net, &init_net=
))
784325e9f037e5f Matthieu Baerts 2020-01-21 @89  		kfree(table);
784325e9f037e5f Matthieu Baerts 2020-01-21  90  err_alloc:
784325e9f037e5f Matthieu Baerts 2020-01-21  91  	return -ENOMEM;
784325e9f037e5f Matthieu Baerts 2020-01-21  92  }
784325e9f037e5f Matthieu Baerts 2020-01-21  93  =


:::::: The code at line 89 was first introduced by commit
:::::: 784325e9f037e5f7a7f9a46ecbb27384128f8b6e mptcp: new sysctl to contro=
l the activation per NS

:::::: TO: Matthieu Baerts <matthieu.baerts@tessares.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7260919534268743643==--

