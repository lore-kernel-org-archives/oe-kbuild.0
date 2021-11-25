Content-Type: multipart/mixed; boundary="===============6535660034610395520=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/eir.c:212:2: warning: Value stored to 'ptr' is never read [clang-analyzer-deadcode.DeadStores]
Date: Thu, 25 Nov 2021 10:25:54 +0800
Message-ID: <202111251040.KnZ82wqt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6535660034610395520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/0day-ci/linux/commits/Luiz-Augusto-von-Dentz/Blu=
etooth-eir-Move-EIR-Adv-Data-functions-to-its-own-file/20210922-113507
head:   cda1eaab813d24fd5a24abcae5c22e15191ee466
commit: cda1eaab813d24fd5a24abcae5c22e15191ee466 Bluetooth: eir: Move EIR/A=
dv Data functions to its own file
date:   9 weeks ago
:::::: branch date: 9 weeks ago
:::::: commit date: 9 weeks ago
config: i386-randconfig-c001-20210927 (https://download.01.org/0day-ci/arch=
ive/20211125/202111251040.KnZ82wqt-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dc6e8d=
fdfe7efecfda318d43a06fae18b40eb498)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/cda1eaab813d24fd5a24abcae=
5c22e15191ee466
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Bluetooth-e=
ir-Move-EIR-Adv-Data-functions-to-its-own-file/20210922-113507
        git checkout cda1eaab813d24fd5a24abcae5c22e15191ee466
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/mac80211/cfg.c:951:3: warning: Value stored to 'pos' is never read [=
clang-analyzer-deadcode.DeadStores]
                   pos +=3D civicloc_len;
                   ^      ~~~~~~~~~~~~
   net/mac80211/cfg.c:951:3: note: Value stored to 'pos' is never read
                   pos +=3D civicloc_len;
                   ^      ~~~~~~~~~~~~
   net/mac80211/cfg.c:3144:3: warning: Value stored to 'pos' is never read =
[clang-analyzer-deadcode.DeadStores]
                   pos +=3D beacon->civicloc_len;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   net/mac80211/cfg.c:3144:3: note: Value stored to 'pos' is never read
                   pos +=3D beacon->civicloc_len;
                   ^      ~~~~~~~~~~~~~~~~~~~~
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   drivers/net/ethernet/intel/i40e/i40e_debugfs.c:1041:5: warning: Value st=
ored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                                   ret =3D -ENOMEM;
                                   ^     ~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_debugfs.c:1041:5: note: Value store=
d to 'ret' is never read
                                   ret =3D -ENOMEM;
                                   ^     ~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:2971:3: warning: Value store=
d to 'protocol' is never read [clang-analyzer-deadcode.DeadStores]
                   protocol =3D vhdr->h_vlan_encapsulated_proto;
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:2971:3: note: Value stored t=
o 'protocol' is never read
                   protocol =3D vhdr->h_vlan_encapsulated_proto;
                   ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:3507:2: warning: Value store=
d to 'tx_bi' is never read [clang-analyzer-deadcode.DeadStores]
           tx_bi =3D first;
           ^       ~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:3507:2: note: Value stored t=
o 'tx_bi' is never read
           tx_bi =3D first;
           ^       ~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:3565:3: warning: Value store=
d to 'tx_bi' is never read [clang-analyzer-deadcode.DeadStores]
                   tx_bi =3D &tx_ring->tx_bi[i];
                   ^       ~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/i40e/i40e_txrx.c:3565:3: note: Value stored t=
o 'tx_bi' is never read
                   tx_bi =3D &tx_ring->tx_bi[i];
                   ^       ~~~~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
>> net/bluetooth/eir.c:212:2: warning: Value stored to 'ptr' is never read =
[clang-analyzer-deadcode.DeadStores]
           ptr =3D create_uuid128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr=
 - data));
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/bluetooth/eir.c:212:2: note: Value stored to 'ptr' is never read
           ptr =3D create_uuid128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr=
 - data));
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   net/bluetooth/eir.c:295:4: warning: Value stored to 'ptr' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ptr +=3D 3;
                           ^      ~
   net/bluetooth/eir.c:295:4: note: Value stored to 'ptr' is never read
                           ptr +=3D 3;
                           ^      ~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/bluetooth/hci_core.c:2192:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:2192:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   net/ipv4/ipconfig.c:366:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ir.ifr_ifrn.ifrn_name, ic_dev->dev->name);

vim +/ptr +212 net/bluetooth/eir.c

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  165  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  166  void eir_create(stru=
ct hci_dev *hdev, u8 *data)
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  167  {
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  168  	u8 *ptr =3D data;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  169  	size_t name_len;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  170  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  171  	name_len =3D strlen=
(hdev->dev_name);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  172  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  173  	if (name_len > 0) {
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  174  		/* EIR Data type */
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  175  		if (name_len > 48)=
 {
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  176  			name_len =3D 48;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  177  			ptr[1] =3D EIR_NA=
ME_SHORT;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  178  		} else {
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  179  			ptr[1] =3D EIR_NA=
ME_COMPLETE;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  180  		}
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  181  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  182  		/* EIR Data length=
 */
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  183  		ptr[0] =3D name_le=
n + 1;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  184  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  185  		memcpy(ptr + 2, hd=
ev->dev_name, name_len);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  186  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  187  		ptr +=3D (name_len=
 + 2);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  188  	}
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  189  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  190  	if (hdev->inq_tx_po=
wer !=3D HCI_TX_POWER_INVALID) {
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  191  		ptr[0] =3D 2;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  192  		ptr[1] =3D EIR_TX_=
POWER;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  193  		ptr[2] =3D (u8)hde=
v->inq_tx_power;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  194  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  195  		ptr +=3D 3;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  196  	}
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  197  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  198  	if (hdev->devid_sou=
rce > 0) {
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  199  		ptr[0] =3D 9;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  200  		ptr[1] =3D EIR_DEV=
ICE_ID;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  201  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  202  		put_unaligned_le16=
(hdev->devid_source, ptr + 2);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  203  		put_unaligned_le16=
(hdev->devid_vendor, ptr + 4);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  204  		put_unaligned_le16=
(hdev->devid_product, ptr + 6);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  205  		put_unaligned_le16=
(hdev->devid_version, ptr + 8);
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  206  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  207  		ptr +=3D 10;
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  208  	}
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  209  =

cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  210  	ptr =3D create_uuid=
16_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  211  	ptr =3D create_uuid=
32_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20 @212  	ptr =3D create_uuid=
128_list(hdev, ptr, HCI_MAX_EIR_LENGTH - (ptr - data));
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  213  }
cda1eaab813d24 Luiz Augusto von Dentz 2021-09-20  214  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6535660034610395520==--

