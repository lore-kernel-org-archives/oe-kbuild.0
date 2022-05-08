Content-Type: multipart/mixed; boundary="===============7585269383954098157=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/8] Bluetooth: Add BTPROTO_ISO socket type
Date: Sun, 08 May 2022 11:53:38 +0800
Message-ID: <202205081133.3PxXkAhF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7585269383954098157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220506215743.3870212-4-luiz.dentz@gmail.com>
References: <20220506215743.3870212-4-luiz.dentz@gmail.com>
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
TO: linux-bluetooth(a)vger.kernel.org

Hi Luiz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master v5.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Den=
tz/Bluetooth-eir-Add-helpers-for-managing-service-data/20220507-060014
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
-next.git master
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm-randconfig-c002-20220507 (https://download.01.org/0day-ci/archi=
ve/20220508/202205081133.3PxXkAhF-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project af4cf1=
c6b8ed0d8102fc5e69acdc2fcbbcdaa9a7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/49e5cffcea408902de7=
318707c7342c91cd9bf85
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Bluetooth-e=
ir-Add-helpers-for-managing-service-data/20220507-060014
        git checkout 49e5cffcea408902de7318707c7342c91cd9bf85
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   goto out;
                   ^
   fs/nilfs2/mdt.c:208:10: note: Assigned value is garbage or undefined
           *out_bh =3D first_bh;
                   ^ ~~~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   48 warnings generated.
   drivers/regulator/pfuze100-regulator.c:763:2: warning: Call to function =
'memcpy' is insecure as it does not provide security checks introduced in t=
he C11 standard. Replace with analogous functions that support length argum=
ents or provides boundary checks such as 'memcpy_s' in case of C11 [clang-a=
nalyzer-security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(pfuze_chip->regulator_descs, pfuze_chip->pfuze_regulators,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   drivers/regulator/pfuze100-regulator.c:763:2: note: Call to function 'me=
mcpy' is insecure as it does not provide security checks introduced in the =
C11 standard. Replace with analogous functions that support length argument=
s or provides boundary checks such as 'memcpy_s' in case of C11
           memcpy(pfuze_chip->regulator_descs, pfuze_chip->pfuze_regulators,
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   47 warnings generated.
   Suppressed 47 warnings (47 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   70 warnings generated.
   drivers/nvme/host/fabrics.c:70:2: warning: Call to function 'snprintf' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'snprintf_s' in case of C11 [clang-analyzer-=
security.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           snprintf(host->nqn, NVMF_NQN_SIZE,
           ^~~~~~~~
   drivers/nvme/host/fabrics.c:70:2: note: Call to function 'snprintf' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'snprintf_s' in case of C11
           snprintf(host->nqn, NVMF_NQN_SIZE,
           ^~~~~~~~
   drivers/nvme/host/fabrics.c:388:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:388:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:389:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:389:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:449:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:449:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->subsysnqn, ctrl->opts->subsysnqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:450:2: warning: Call to function 'strncpy' i=
s insecure as it does not provide security checks introduced in the C11 sta=
ndard. Replace with analogous functions that support length arguments or pr=
ovides boundary checks such as 'strncpy_s' in case of C11 [clang-analyzer-s=
ecurity.insecureAPI.DeprecatedOrUnsafeBufferHandling]
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   drivers/nvme/host/fabrics.c:450:2: note: Call to function 'strncpy' is i=
nsecure as it does not provide security checks introduced in the C11 standa=
rd. Replace with analogous functions that support length arguments or provi=
des boundary checks such as 'strncpy_s' in case of C11
           strncpy(data->hostnqn, ctrl->opts->host->nqn, NVMF_NQN_SIZE);
           ^~~~~~~
   Suppressed 65 warnings (65 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   76 warnings generated.
   net/bluetooth/iso.c:940:3: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&qos, 0, sizeof(qos));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/iso.c:940:3: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
                   memset(&qos, 0, sizeof(qos));
                   ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
>> net/bluetooth/iso.c:1252:3: warning: Value stored to 'flags' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                   flags  =3D hci_iso_data_flags(len);
                   ^
   net/bluetooth/iso.c:1252:3: note: Value stored to 'flags' is never read
   Suppressed 74 warnings (74 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   91 warnings generated.
   net/bluetooth/a2mp.c:37:2: warning: Call to function 'memcpy' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memcpy_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memcpy(cmd->data, data, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:37:2: note: Call to function 'memcpy' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memcpy_s' in case of C11
           memcpy(cmd->data, data, len);
           ^
   include/linux/fortify-string.h:369:26: note: expanded from macro 'memcpy'
   #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:362:2: note: expanded from macro '__forti=
fy_memcpy_chk'
           __underlying_##op(p, q, __fortify_size);                        \
           ^~~~~~~~~~~~~~~~~
   note: expanded from here
   include/linux/fortify-string.h:45:29: note: expanded from macro '__under=
lying_memcpy'
   #define __underlying_memcpy     __builtin_memcpy
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:57:2: warning: Call to function 'memset' is insecur=
e as it does not provide security checks introduced in the C11 standard. Re=
place with analogous functions that support length arguments or provides bo=
undary checks such as 'memset_s' in case of C11 [clang-analyzer-security.in=
secureAPI.DeprecatedOrUnsafeBufferHandling]
           memset(&msg, 0, sizeof(msg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:57:2: note: Call to function 'memset' is insecure a=
s it does not provide security checks introduced in the C11 standard. Repla=
ce with analogous functions that support length arguments or provides bound=
ary checks such as 'memset_s' in case of C11
           memset(&msg, 0, sizeof(msg));
           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:118:23: warning: Value stored to 'rej' during its i=
nitialization is never read [clang-analyzer-deadcode.DeadStores]
           struct a2mp_cmd_rej *rej =3D (void *) skb->data;
                                ^~~   ~~~~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:118:23: note: Value stored to 'rej' during its init=
ialization is never read
           struct a2mp_cmd_rej *rej =3D (void *) skb->data;
                                ^~~   ~~~~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:230:4: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                           memset(&req, 0, sizeof(req));
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:230:4: note: Call to function 'memset' is insecure =
as it does not provide security checks introduced in the C11 standard. Repl=
ace with analogous functions that support length arguments or provides boun=
dary checks such as 'memset_s' in case of C11
                           memset(&req, 0, sizeof(req));
                           ^
   include/linux/fortify-string.h:272:25: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:265:2: note: expanded from macro '__forti=
fy_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:47:29: note: expanded from macro '__under=
lying_memset'
   #define __underlying_memset     __builtin_memset
                                   ^~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:273:18: warning: Value stored to 'cl' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct a2mp_cl *cl =3D (void *) skb->data;
                           ^~   ~~~~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:273:18: note: Value stored to 'cl' during its initi=
alization is never read
           struct a2mp_cl *cl =3D (void *) skb->data;
                           ^~   ~~~~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:278:3: warning: Value stored to 'cl' is never read =
[clang-analyzer-deadcode.DeadStores]
                   cl =3D skb_pull(skb, sizeof(*cl));
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:278:3: note: Value stored to 'cl' is never read
                   cl =3D skb_pull(skb, sizeof(*cl));
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/a2mp.c:311:3: warning: Call to function 'memset' is insecu=
re as it does not provide security checks introduced in the C11 standard. R=
eplace with analogous functions that support length arguments or provides b=
oundary checks such as 'memset_s' in case of C11 [clang-analyzer-security.i=
nsecureAPI.DeprecatedOrUnsafeBufferHandling]
                   memset(&rsp, 0, sizeof(rsp));

vim +/flags +1252 net/bluetooth/iso.c

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1210  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1211  void iso_recv(struc=
t hci_conn *hcon, struct sk_buff *skb, u16 flags)
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1212  {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1213  	struct iso_conn *c=
onn =3D hcon->iso_data;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1214  	struct hci_iso_dat=
a_hdr *hdr;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1215  	__u16 pb, ts, len;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1216  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1217  	if (!conn)
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1218  		goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1219  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1220  	pb     =3D hci_iso=
_flags_pb(flags);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1221  	ts     =3D hci_iso=
_flags_ts(flags);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1222  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1223  	BT_DBG("conn %p le=
n %d pb 0x%x ts 0x%x", conn, skb->len, pb, ts);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1224  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1225  	switch (pb) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1226  	case ISO_START:
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1227  	case ISO_SINGLE:
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1228  		if (conn->rx_len)=
 {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1229  			BT_ERR("Unexpect=
ed start frame (len %d)", skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1230  			kfree_skb(conn->=
rx_skb);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1231  			conn->rx_skb =3D=
 NULL;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1232  			conn->rx_len =3D=
 0;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1233  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1234  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1235  		if (ts) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1236  			/* TODO: add tim=
estamp to the packet? */
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1237  			hdr =3D skb_pull=
_data(skb, HCI_ISO_TS_DATA_HDR_SIZE);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1238  			if (!hdr) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1239  				BT_ERR("Frame i=
s too short (len %d)", skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1240  				goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1241  			}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1242  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1243  		} else {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1244  			hdr =3D skb_pull=
_data(skb, HCI_ISO_DATA_HDR_SIZE);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1245  			if (!hdr) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1246  				BT_ERR("Frame i=
s too short (len %d)", skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1247  				goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1248  			}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1249  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1250  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1251  		len    =3D __le16=
_to_cpu(hdr->slen);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06 @1252  		flags  =3D hci_is=
o_data_flags(len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1253  		len    =3D hci_is=
o_data_len(len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1254  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1255  		BT_DBG("Start: to=
tal len %d, frag len %d flags 0x%4.4x", len,
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1256  		       skb->len, =
flags);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1257  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1258  		if (len =3D=3D sk=
b->len) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1259  			/* Complete fram=
e received */
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1260  			iso_recv_frame(c=
onn, skb);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1261  			return;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1262  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1263  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1264  		if (pb =3D=3D ISO=
_SINGLE) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1265  			BT_ERR("Frame ma=
lformed (len %d, expected len %d)",
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1266  			       skb->len,=
 len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1267  			goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1268  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1269  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1270  		if (skb->len > le=
n) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1271  			BT_ERR("Frame is=
 too long (len %d, expected len %d)",
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1272  			       skb->len,=
 len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1273  			goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1274  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1275  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1276  		/* Allocate skb f=
or the complete frame (with header) */
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1277  		conn->rx_skb =3D =
bt_skb_alloc(len, GFP_KERNEL);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1278  		if (!conn->rx_skb)
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1279  			goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1280  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1281  		skb_copy_from_lin=
ear_data(skb, skb_put(conn->rx_skb, skb->len),
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1282  					  skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1283  		conn->rx_len =3D =
len - skb->len;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1284  		break;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1285  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1286  	case ISO_CONT:
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1287  		BT_DBG("Cont: fra=
g len %d (expecting %d)", skb->len,
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1288  		       conn->rx_l=
en);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1289  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1290  		if (!conn->rx_len=
) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1291  			BT_ERR("Unexpect=
ed continuation frame (len %d)",
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1292  			       skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1293  			goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1294  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1295  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1296  		if (skb->len > co=
nn->rx_len) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1297  			BT_ERR("Fragment=
 is too long (len %d, expected %d)",
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1298  			       skb->len,=
 conn->rx_len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1299  			kfree_skb(conn->=
rx_skb);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1300  			conn->rx_skb =3D=
 NULL;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1301  			conn->rx_len =3D=
 0;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1302  			goto drop;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1303  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1304  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1305  		skb_copy_from_lin=
ear_data(skb, skb_put(conn->rx_skb, skb->len),
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1306  					  skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1307  		conn->rx_len -=3D=
 skb->len;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1308  		return;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1309  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1310  	case ISO_END:
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1311  		skb_copy_from_lin=
ear_data(skb, skb_put(conn->rx_skb, skb->len),
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1312  					  skb->len);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1313  		conn->rx_len -=3D=
 skb->len;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1314  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1315  		if (!conn->rx_len=
) {
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1316  			struct sk_buff *=
rx_skb =3D conn->rx_skb;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1317  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1318  			/* Complete fram=
e received. iso_recv_frame
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1319  			 * takes ownersh=
ip of the skb so set the global
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1320  			 * rx_skb pointe=
r to NULL first.
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1321  			 */
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1322  			conn->rx_skb =3D=
 NULL;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1323  			iso_recv_frame(c=
onn, rx_skb);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1324  		}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1325  		break;
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1326  	}
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1327  =

49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1328  drop:
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1329  	kfree_skb(skb);
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1330  }
49e5cffcea4089 Luiz Augusto von Dentz 2022-05-06  1331  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7585269383954098157==--

