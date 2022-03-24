Content-Type: multipart/mixed; boundary="===============3039023802198723713=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] Bluetooth: Add support for devcoredump
Date: Thu, 24 Mar 2022 12:31:27 +0800
Message-ID: <202203241228.EDfAR8zW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3039023802198723713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220320183225.1.Iaf638bb9f885f5880ab1b4e7ae2f73dd53a54661@=
changeid>
References: <20220320183225.1.Iaf638bb9f885f5880ab1b4e7ae2f73dd53a54661@c=
hangeid>
TO: Manish Mandlik <mmandlik@google.com>
TO: marcel(a)holtmann.org
TO: luiz.dentz(a)gmail.com
CC: chromeos-bluetooth-upstreaming(a)chromium.org
CC: linux-bluetooth(a)vger.kernel.org
CC: "Abhishek Pandit-Subedi" <abhishekpandit@chromium.org>
CC: Manish Mandlik <mmandlik@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Johan Hedberg <johan.hedberg@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: linux-kernel(a)vger.kernel.org
CC: netdev(a)vger.kernel.org

Hi Manish,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on bluetooth/master]
[also build test WARNING on bluetooth-next/master v5.17 next-20220323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manish-Mandlik/Bluetooth-A=
dd-support-for-devcoredump/20220321-093553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
.git master
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
324/202203241228.EDfAR8zW-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ac170a5ea7c81e445f903d14d=
ce2a5f92155d1ef
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Manish-Mandlik/Bluetooth-Add-suppo=
rt-for-devcoredump/20220321-093553
        git checkout ac170a5ea7c81e445f903d14dce2a5f92155d1ef
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           strcpy(motu->card->mixername, motu->spec->name);
           ^~~~~~
   sound/firewire/motu/motu.c:46:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(motu->card->mixername, motu->spec->name);
           ^~~~~~
   1 warning generated.
   sound/firewire/motu/motu-pcm.c:363:2: warning: Call to function 'strcpy'=
 is insecure as it does not provide bounding of the memory buffer. Replace =
unbounded copy functions with analogous functions that support length argum=
ents such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(pcm->name, motu->card->shortname);
           ^~~~~~
   sound/firewire/motu/motu-pcm.c:363:2: note: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119
           strcpy(pcm->name, motu->card->shortname);
           ^~~~~~
   2 warnings generated.
   sound/firewire/fireface/ff.c:31:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:31:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->shortname, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(ff->card->mixername, name);
           ^~~~~~
   sound/firewire/fireface/ff.c:32:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy(ff->card->mixername, name);
           ^~~~~~
   1 warning generated.
   sound/firewire/fireface/ff-hwdep.c:181:2: warning: Call to function 'str=
cpy' is insecure as it does not provide bounding of the memory buffer. Repl=
ace unbounded copy functions with analogous functions that support length a=
rguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.st=
rcpy]
           strcpy(hwdep->name, ff->card->driver);
           ^~~~~~
   sound/firewire/fireface/ff-hwdep.c:181:2: note: Call to function 'strcpy=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcpy'. CWE-119
           strcpy(hwdep->name, ff->card->driver);
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/xfs/xfs_reflink.c:1154:3: warning: Value stored to 'qdelta' is never =
read [clang-analyzer-deadcode.DeadStores]
                   qdelta +=3D dmap->br_blockcount;
                   ^         ~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_reflink.c:1154:3: note: Value stored to 'qdelta' is never read
                   qdelta +=3D dmap->br_blockcount;
                   ^         ~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (1 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/net/can/softing/softing_fw.c:531:3: warning: Value stored to 'er=
ror_reporting' is never read [clang-analyzer-deadcode.DeadStores]
                   error_reporting +=3D softing_error_reporting(netdev);
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/can/softing/softing_fw.c:531:3: note: Value stored to 'error=
_reporting' is never read
                   error_reporting +=3D softing_error_reporting(netdev);
                   ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   net/bluetooth/hci_core.c:891:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:891:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
>> net/bluetooth/hci_core.c:2467:2: warning: Value stored to 'ptr' is never=
 read [clang-analyzer-deadcode.DeadStores]
           ptr +=3D read;
           ^      ~~~~
   net/bluetooth/hci_core.c:2467:2: note: Value stored to 'ptr' is never re=
ad
           ptr +=3D read;
           ^      ~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:372:4: warning: Value s=
tored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                           err =3D 0;
                           ^     ~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-regmap.c:372:4: note: Value stor=
ed to 'err' is never read
                           err =3D 0;
                           ^     ~
   1 warning generated.
   drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c:152:34: warning: Value sto=
red to 'tx_ring' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           const struct mcp251xfd_tx_ring *tx_ring =3D priv->tx;
                                           ^~~~~~~   ~~~~~~~~
   drivers/net/can/spi/mcp251xfd/mcp251xfd-tef.c:152:34: note: Value stored=
 to 'tx_ring' during its initialization is never read
           const struct mcp251xfd_tx_ring *tx_ring =3D priv->tx;
                                           ^~~~~~~   ~~~~~~~~
   1 warning generated.
   sound/soc/codecs/da7213.c:1427:3: warning: Value stored to 'indiv' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   indiv =3D DA7213_PLL_INDIV_9_TO_18_MHZ_VAL;
                   ^
   sound/soc/codecs/da7213.c:1427:3: note: Value stored to 'indiv' is never=
 read
   1 warning generated.
   drivers/media/i2c/imx258.c:781:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx258.c:781:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   sound/firewire/fireworks/fireworks.c:94:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(efw->card->shortname, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:94:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(efw->card->shortname, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:95:2: warning: Call to function 'st=
rcpy' is insecure as it does not provide bounding of the memory buffer. Rep=
lace unbounded copy functions with analogous functions that support length =
arguments such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.s=
trcpy]
           strcpy(efw->card->mixername, hwinfo->model_name);
           ^~~~~~
   sound/firewire/fireworks/fireworks.c:95:2: note: Call to function 'strcp=
y' is insecure as it does not provide bounding of the memory buffer. Replac=
e unbounded copy functions with analogous functions that support length arg=
uments such as 'strlcpy'. CWE-119
           strcpy(efw->card->mixername, hwinfo->model_name);
           ^~~~~~
   1 warning generated.
   drivers/input/rmi4/rmi_f11.c:1129:2: warning: Value stored to 'query_off=
set' is never read [clang-analyzer-deadcode.DeadStores]
           query_offset +=3D rc;
           ^               ~~
   drivers/input/rmi4/rmi_f11.c:1129:2: note: Value stored to 'query_offset=
' is never read
           query_offset +=3D rc;
           ^               ~~
   3 warnings generated.
   drivers/input/rmi4/rmi_f12.c:133:3: warning: Value stored to 'offset' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:133:3: note: Value stored to 'offset' is ne=
ver read
                   offset +=3D 1;
                   ^         ~
   drivers/input/rmi4/rmi_f12.c:401:2: warning: Value stored to 'query_addr=
' is never read [clang-analyzer-deadcode.DeadStores]
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:401:2: note: Value stored to 'query_addr' i=
s never read
           query_addr +=3D 3;
           ^             ~
   drivers/input/rmi4/rmi_f12.c:520:3: warning: Value stored to 'data_offse=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   drivers/input/rmi4/rmi_f12.c:520:3: note: Value stored to 'data_offset' =
is never read
                   data_offset +=3D item->reg_size;
                   ^              ~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/media/i2c/adv7170.c:361:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:361:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7170.c:362:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7170_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.
   drivers/media/i2c/adv7175.c:416:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7175_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:416:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7175_write(sd, 0x07, TR0MODE | TR0RST);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:417:3: warning: Value stored to 'i' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   i =3D adv7175_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/adv7175.c:417:3: note: Value stored to 'i' is never re=
ad
                   i =3D adv7175_write(sd, 0x07, TR0MODE);
                   ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   arch/x86/include/asm/paravirt.h:55:2: warning: Assigned value is garbage=
 or undefined [clang-analyzer-core.uninitialized.Assign]

vim +/ptr +2467 net/bluetooth/hci_core.c

ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2445  =

ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2446  static int hci_devc=
oredump_mkheader(struct hci_dev *hdev, char *buf,
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2447  				    size_t buf_=
size)
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2448  {
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2449  	char *ptr =3D buf;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2450  	size_t rem =3D buf=
_size;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2451  	size_t read =3D 0;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2452  =

ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2453  	read =3D hci_devco=
redump_update_hdr_state(ptr, rem, HCI_DEVCOREDUMP_IDLE);
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2454  	read +=3D 1; /* up=
date_hdr_state adds \0 at the end upon state rewrite */
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2455  	rem -=3D read;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2456  	ptr +=3D read;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2457  =

ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2458  	if (hdev->dump.dmp=
_hdr) {
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2459  		/* dmp_hdr() shou=
ld return number of bytes written */
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2460  		read =3D hdev->du=
mp.dmp_hdr(hdev, ptr, rem);
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2461  		rem -=3D read;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2462  		ptr +=3D read;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2463  	}
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2464  =

ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2465  	read =3D snprintf(=
ptr, rem, "--- Start dump ---\n");
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2466  	rem -=3D read;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20 @2467  	ptr +=3D read;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2468  =

ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2469  	return buf_size - =
rem;
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2470  }
ac170a5ea7c81e Abhishek Pandit-Subedi 2022-03-20  2471  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3039023802198723713==--

