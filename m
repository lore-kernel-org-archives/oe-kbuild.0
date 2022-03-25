Content-Type: multipart/mixed; boundary="===============5497835812470340837=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] Bluetooth: Add support for devcoredump
Date: Fri, 25 Mar 2022 16:04:01 +0800
Message-ID: <202203251548.aVjcdELg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5497835812470340837==
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
[also build test WARNING on bluetooth-next/master v5.17 next-20220324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Manish-Mandlik/Bluetooth-A=
dd-support-for-devcoredump/20220321-093553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth=
.git master
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
325/202203251548.aVjcdELg-lkp(a)intel.com/config)
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
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/btree.c:764:2: note: Loop condition is true.  Entering=
 loop body
           while (!list_empty(&c->btree_cache_freed)) {
           ^
   drivers/md/bcache/btree.c:767:3: note: Calling 'list_del'
                   list_del(&b->list);
                   ^~~~~~~~~~~~~~~~~~
   include/linux/list.h:149:14: note: Use of memory after it is freed
           entry->next =3D LIST_POISON1;
           ~~~~~~~~~~~ ^
   1 warning generated.
   drivers/nvme/target/fcloop.c:1226:3: warning: Value stored to 'ret' is n=
ever read [clang-analyzer-deadcode.DeadStores]
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   drivers/nvme/target/fcloop.c:1226:3: note: Value stored to 'ret' is neve=
r read
                   ret =3D -EINVAL;
                   ^     ~~~~~~~
   1 warning generated.
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: warning: Value stored t=
o 'mode_entry' during its initialization is never read [clang-analyzer-dead=
code.DeadStores]
                   u32 mode_entry =3D readl(base);
                       ^~~~~~~~~~
   drivers/i3c/master/mipi-i3c-hci/ext_caps.c:78:7: note: Value stored to '=
mode_entry' during its initialization is never read
                   u32 mode_entry =3D readl(base);
                       ^~~~~~~~~~
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
   1 warning generated.
   drivers/accessibility/speakup/speakup_soft.c:174:2: warning: Value store=
d to 'cp' is never read [clang-analyzer-deadcode.DeadStores]
           cp =3D cp + scnprintf(cp, len, "\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/accessibility/speakup/speakup_soft.c:174:2: note: Value stored t=
o 'cp' is never read
           cp =3D cp + scnprintf(cp, len, "\n");
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   drivers/bcma/main.c:674:3: warning: Value stored to 'err' is never read =
[clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   drivers/bcma/main.c:674:3: note: Value stored to 'err' is never read
                   err =3D 0;
                   ^     ~
   3 warnings generated.
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:536:2: warning: Value=
 stored to 'err' is never read [clang-analyzer-deadcode.DeadStores]
           err =3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c:536:2: note: Value st=
ored to 'err' is never read
           err =3D anx78xx_clear_bits(anx78xx->map[I2C_IDX_TX_P2],
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 with check filters).
   1 warning generated.
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:424:2: warning: Value =
stored to 'reg' is never read [clang-analyzer-deadcode.DeadStores]
           reg =3D readl(dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
           ^
   drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c:424:2: note: Value sto=
red to 'reg' is never read
   1 warning generated.
   drivers/mmc/core/sdio_cis.c:63:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(string, buf);
                   ^~~~~~
   drivers/mmc/core/sdio_cis.c:63:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(string, buf);
                   ^~~~~~
   1 warning generated.
   drivers/w1/slaves/w1_ds2438.c:69:3: warning: Value stored to 'crc' is ne=
ver read [clang-analyzer-deadcode.DeadStores]
                   crc =3D 0;
                   ^     ~
   drivers/w1/slaves/w1_ds2438.c:69:3: note: Value stored to 'crc' is never=
 read
                   crc =3D 0;
                   ^     ~
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
   2 warnings generated.
   sound/drivers/mpu401/mpu401.c:67:2: warning: Call to function 'strcpy' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, card->driver);
           ^~~~~~
   sound/drivers/mpu401/mpu401.c:67:2: note: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119
           strcpy(card->shortname, card->driver);
           ^~~~~~
   sound/drivers/mpu401/mpu401.c:72:3: warning: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcat(card->longname, "polled");
                   ^~~~~~
   sound/drivers/mpu401/mpu401.c:72:3: note: Call to function 'strcat' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcat'. CWE-119
                   strcat(card->longname, "polled");
                   ^~~~~~
   1 warning generated.
   sound/isa/es18xx.c:1777:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->mixername, chip->pcm->name);
           ^~~~~~
   sound/isa/es18xx.c:1777:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->mixername, chip->pcm->name);
           ^~~~~~
   1 warning generated.
   sound/isa/opl3sa2.c:242:2: warning: Call to function 'strcat' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcat(card->shortname, str);
           ^~~~~~
   sound/isa/opl3sa2.c:242:2: note: Call to function 'strcat' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcat'. CWE-119
           strcat(card->shortname, str);
           ^~~~~~
   1 warning generated.
   sound/isa/sscape.c:1052:2: warning: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(card->shortname, name);
           ^~~~~~
   sound/isa/sscape.c:1052:2: note: Call to function 'strcpy' is insecure a=
s it does not provide bounding of the memory buffer. Replace unbounded copy=
 functions with analogous functions that support length arguments such as '=
strlcpy'. CWE-119
           strcpy(card->shortname, name);
           ^~~~~~
   1 warning generated.
   drivers/nvme/target/core.c:1124:10: warning: Although the value stored t=
o 'cc_css' is used in the enclosing expression, the value is never actually=
 read from 'cc_css' [clang-analyzer-deadcode.DeadStores]
           switch (cc_css <<=3D NVME_CC_CSS_SHIFT) {
                   ^          ~~~~~~~~~~~~~~~~~
   drivers/nvme/target/core.c:1124:10: note: Although the value stored to '=
cc_css' is used in the enclosing expression, the value is never actually re=
ad from 'cc_css'
           switch (cc_css <<=3D NVME_CC_CSS_SHIFT) {
                   ^          ~~~~~~~~~~~~~~~~~
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
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).

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
date_hdr_state adds \0@the end upon state rewrite */
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
--===============5497835812470340837==--

