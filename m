Content-Type: multipart/mixed; boundary="===============5045770846233057073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_event.c:3728:21: warning: Excessive padding in 'struct hci_cc' (10 padding bytes, where 2 is optimal).
Date: Wed, 16 Mar 2022 10:03:27 +0800
Message-ID: <202203160959.pC7lGBzc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5045770846233057073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   56e337f2cf1326323844927a04e9dbce9a244835
commit: c8992cffbe7411c6da4c4416d5eecfc6b78e0fec Bluetooth: hci_event: Use =
of a function table to handle Command Complete
date:   3 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220316/202203160959.pC7lGBzc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc8992cffbe7411c6da4c4416d5eecfc6b78e0fec
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c8992cffbe7411c6da4c4416d5eecfc6b78e0fec
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
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
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/i2c/imx258.c:781:3: warning: Value stored to 'ret' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx258.c:781:3: note: Value stored to 'ret' is never r=
ead
                   ret =3D imx258_write_reg(imx258, IMX258_REG_TEST_PATTERN,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
>> net/bluetooth/hci_event.c:3728:21: warning: Excessive padding in 'struct=
 hci_cc' (10 padding bytes, where 2 is optimal). =

   Optimal fields order: =

   func, =

   op, =

   min_len, =

   max_len, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct hci_cc {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:3728:21: note: Excessive padding in 'struct hc=
i_cc' (10 padding bytes, where 2 is optimal). Optimal fields order: func, o=
p, min_len, max_len, consider reordering the fields or adding explicit padd=
ing members
   static const struct hci_cc {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:6632:21: warning: Excessive padding in 'struct=
 hci_ev' (11 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   , =

   min_len, =

   max_len, =

   req, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   net/bluetooth/hci_event.c:6632:21: note: Excessive padding in 'struct hc=
i_ev' (11 padding bytes, where 3 is optimal). Optimal fields order: , min_l=
en, max_len, req, consider reordering the fields or adding explicit padding=
 members
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   net/bluetooth/mgmt.c:6572:4: warning: Value stored to 'authenticated' is=
 never read [clang-analyzer-deadcode.DeadStores]
                           authenticated =3D 0x00;
                           ^               ~~~~
   net/bluetooth/mgmt.c:6572:4: note: Value stored to 'authenticated' is ne=
ver read
                           authenticated =3D 0x00;
                           ^               ~~~~
   net/bluetooth/mgmt.c:6573:4: warning: Value stored to 'type' is never re=
ad [clang-analyzer-deadcode.DeadStores]
                           type =3D SMP_LTK_P256_DEBUG;
                           ^      ~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:6573:4: note: Value stored to 'type' is never read
                           type =3D SMP_LTK_P256_DEBUG;
                           ^      ~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7520:2: warning: Value stored to 'err' is never rea=
d [clang-analyzer-deadcode.DeadStores]
           err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7520:2: note: Value stored to 'err' is never read
           err =3D mgmt_limited_event(MGMT_EV_LOCAL_OOB_DATA_UPDATED, hdev,
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/mgmt.c:7866:14: warning: Although the value stored to 'cur=
_len' is used in the enclosing expression, the value is never actually read=
 from 'cur_len' [clang-analyzer-deadcode.DeadStores]
           for (i =3D 0, cur_len =3D 0; i < len; i +=3D (cur_len + 1)) {
                       ^         ~
   net/bluetooth/mgmt.c:7866:14: note: Although the value stored to 'cur_le=
n' is used in the enclosing expression, the value is never actually read fr=
om 'cur_len'
           for (i =3D 0, cur_len =3D 0; i < len; i +=3D (cur_len + 1)) {
                       ^         ~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/most/configfs.c:173:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:173:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->direction, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:192:2: note: Call to function 'strcpy' is insecu=
re as it does not provide bounding of the memory buffer. Replace unbounded =
copy functions with analogous functions that support length arguments such =
as 'strlcpy'. CWE-119
           strcpy(mdev_link->datatype, page);
           ^~~~~~
   drivers/most/configfs.c:446:2: warning: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(mdev_link->name, name);
           ^~~~~~
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
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +3728 net/bluetooth/hci_event.c

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3721  =

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3722  #define HCI_CC(_op,=
 _func, _len) \
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3723  	HCI_CC_VL(_op, _fu=
nc, _len, _len)
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3724  =

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3725  #define HCI_CC_STAT=
US(_op, _func) \
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3726  	HCI_CC(_op, _func,=
 sizeof(struct hci_ev_status))
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3727  =

c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01 @3728  static const struct=
 hci_cc {
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3729  	u16  op;
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3730  	u8 (*func)(struct =
hci_dev *hdev, void *data, struct sk_buff *skb);
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3731  	u16  min_len;
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3732  	u16  max_len;
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3733  } hci_cc_table[] =
=3D {
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3734  	HCI_CC_STATUS(HCI_=
OP_INQUIRY_CANCEL, hci_cc_inquiry_cancel),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3735  	HCI_CC_STATUS(HCI_=
OP_PERIODIC_INQ, hci_cc_periodic_inq),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3736  	HCI_CC_STATUS(HCI_=
OP_EXIT_PERIODIC_INQ, hci_cc_exit_periodic_inq),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3737  	HCI_CC_STATUS(HCI_=
OP_REMOTE_NAME_REQ_CANCEL,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3738  		      hci_cc_remo=
te_name_req_cancel),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3739  	HCI_CC(HCI_OP_ROLE=
_DISCOVERY, hci_cc_role_discovery,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3740  	       sizeof(stru=
ct hci_rp_role_discovery)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3741  	HCI_CC(HCI_OP_READ=
_LINK_POLICY, hci_cc_read_link_policy,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3742  	       sizeof(stru=
ct hci_rp_read_link_policy)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3743  	HCI_CC(HCI_OP_WRIT=
E_LINK_POLICY, hci_cc_write_link_policy,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3744  	       sizeof(stru=
ct hci_rp_write_link_policy)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3745  	HCI_CC(HCI_OP_READ=
_DEF_LINK_POLICY, hci_cc_read_def_link_policy,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3746  	       sizeof(stru=
ct hci_rp_read_def_link_policy)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3747  	HCI_CC_STATUS(HCI_=
OP_WRITE_DEF_LINK_POLICY,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3748  		      hci_cc_writ=
e_def_link_policy),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3749  	HCI_CC_STATUS(HCI_=
OP_RESET, hci_cc_reset),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3750  	HCI_CC(HCI_OP_READ=
_STORED_LINK_KEY, hci_cc_read_stored_link_key,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3751  	       sizeof(stru=
ct hci_rp_read_stored_link_key)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3752  	HCI_CC(HCI_OP_DELE=
TE_STORED_LINK_KEY, hci_cc_delete_stored_link_key,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3753  	       sizeof(stru=
ct hci_rp_delete_stored_link_key)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3754  	HCI_CC_STATUS(HCI_=
OP_WRITE_LOCAL_NAME, hci_cc_write_local_name),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3755  	HCI_CC(HCI_OP_READ=
_LOCAL_NAME, hci_cc_read_local_name,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3756  	       sizeof(stru=
ct hci_rp_read_local_name)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3757  	HCI_CC_STATUS(HCI_=
OP_WRITE_AUTH_ENABLE, hci_cc_write_auth_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3758  	HCI_CC_STATUS(HCI_=
OP_WRITE_ENCRYPT_MODE, hci_cc_write_encrypt_mode),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3759  	HCI_CC_STATUS(HCI_=
OP_WRITE_SCAN_ENABLE, hci_cc_write_scan_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3760  	HCI_CC_STATUS(HCI_=
OP_SET_EVENT_FLT, hci_cc_set_event_filter),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3761  	HCI_CC(HCI_OP_READ=
_CLASS_OF_DEV, hci_cc_read_class_of_dev,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3762  	       sizeof(stru=
ct hci_rp_read_class_of_dev)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3763  	HCI_CC_STATUS(HCI_=
OP_WRITE_CLASS_OF_DEV, hci_cc_write_class_of_dev),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3764  	HCI_CC(HCI_OP_READ=
_VOICE_SETTING, hci_cc_read_voice_setting,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3765  	       sizeof(stru=
ct hci_rp_read_voice_setting)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3766  	HCI_CC_STATUS(HCI_=
OP_WRITE_VOICE_SETTING, hci_cc_write_voice_setting),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3767  	HCI_CC(HCI_OP_READ=
_NUM_SUPPORTED_IAC, hci_cc_read_num_supported_iac,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3768  	       sizeof(stru=
ct hci_rp_read_num_supported_iac)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3769  	HCI_CC_STATUS(HCI_=
OP_WRITE_SSP_MODE, hci_cc_write_ssp_mode),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3770  	HCI_CC_STATUS(HCI_=
OP_WRITE_SC_SUPPORT, hci_cc_write_sc_support),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3771  	HCI_CC(HCI_OP_READ=
_AUTH_PAYLOAD_TO, hci_cc_read_auth_payload_timeout,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3772  	       sizeof(stru=
ct hci_rp_read_auth_payload_to)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3773  	HCI_CC(HCI_OP_WRIT=
E_AUTH_PAYLOAD_TO, hci_cc_write_auth_payload_timeout,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3774  	       sizeof(stru=
ct hci_rp_write_auth_payload_to)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3775  	HCI_CC(HCI_OP_READ=
_LOCAL_VERSION, hci_cc_read_local_version,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3776  	       sizeof(stru=
ct hci_rp_read_local_version)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3777  	HCI_CC(HCI_OP_READ=
_LOCAL_COMMANDS, hci_cc_read_local_commands,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3778  	       sizeof(stru=
ct hci_rp_read_local_commands)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3779  	HCI_CC(HCI_OP_READ=
_LOCAL_FEATURES, hci_cc_read_local_features,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3780  	       sizeof(stru=
ct hci_rp_read_local_features)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3781  	HCI_CC(HCI_OP_READ=
_LOCAL_EXT_FEATURES, hci_cc_read_local_ext_features,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3782  	       sizeof(stru=
ct hci_rp_read_local_ext_features)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3783  	HCI_CC(HCI_OP_READ=
_BUFFER_SIZE, hci_cc_read_buffer_size,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3784  	       sizeof(stru=
ct hci_rp_read_buffer_size)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3785  	HCI_CC(HCI_OP_READ=
_BD_ADDR, hci_cc_read_bd_addr,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3786  	       sizeof(stru=
ct hci_rp_read_bd_addr)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3787  	HCI_CC(HCI_OP_READ=
_LOCAL_PAIRING_OPTS, hci_cc_read_local_pairing_opts,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3788  	       sizeof(stru=
ct hci_rp_read_local_pairing_opts)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3789  	HCI_CC(HCI_OP_READ=
_PAGE_SCAN_ACTIVITY, hci_cc_read_page_scan_activity,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3790  	       sizeof(stru=
ct hci_rp_read_page_scan_activity)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3791  	HCI_CC_STATUS(HCI_=
OP_WRITE_PAGE_SCAN_ACTIVITY,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3792  		      hci_cc_writ=
e_page_scan_activity),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3793  	HCI_CC(HCI_OP_READ=
_PAGE_SCAN_TYPE, hci_cc_read_page_scan_type,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3794  	       sizeof(stru=
ct hci_rp_read_page_scan_type)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3795  	HCI_CC_STATUS(HCI_=
OP_WRITE_PAGE_SCAN_TYPE, hci_cc_write_page_scan_type),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3796  	HCI_CC(HCI_OP_READ=
_DATA_BLOCK_SIZE, hci_cc_read_data_block_size,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3797  	       sizeof(stru=
ct hci_rp_read_data_block_size)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3798  	HCI_CC(HCI_OP_READ=
_FLOW_CONTROL_MODE, hci_cc_read_flow_control_mode,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3799  	       sizeof(stru=
ct hci_rp_read_flow_control_mode)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3800  	HCI_CC(HCI_OP_READ=
_LOCAL_AMP_INFO, hci_cc_read_local_amp_info,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3801  	       sizeof(stru=
ct hci_rp_read_local_amp_info)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3802  	HCI_CC(HCI_OP_READ=
_CLOCK, hci_cc_read_clock,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3803  	       sizeof(stru=
ct hci_rp_read_clock)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3804  	HCI_CC(HCI_OP_READ=
_INQ_RSP_TX_POWER, hci_cc_read_inq_rsp_tx_power,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3805  	       sizeof(stru=
ct hci_rp_read_inq_rsp_tx_power)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3806  	HCI_CC(HCI_OP_READ=
_DEF_ERR_DATA_REPORTING,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3807  	       hci_cc_read=
_def_err_data_reporting,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3808  	       sizeof(stru=
ct hci_rp_read_def_err_data_reporting)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3809  	HCI_CC_STATUS(HCI_=
OP_WRITE_DEF_ERR_DATA_REPORTING,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3810  		      hci_cc_writ=
e_def_err_data_reporting),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3811  	HCI_CC(HCI_OP_PIN_=
CODE_REPLY, hci_cc_pin_code_reply,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3812  	       sizeof(stru=
ct hci_rp_pin_code_reply)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3813  	HCI_CC(HCI_OP_PIN_=
CODE_NEG_REPLY, hci_cc_pin_code_neg_reply,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3814  	       sizeof(stru=
ct hci_rp_pin_code_neg_reply)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3815  	HCI_CC(HCI_OP_READ=
_LOCAL_OOB_DATA, hci_cc_read_local_oob_data,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3816  	       sizeof(stru=
ct hci_rp_read_local_oob_data)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3817  	HCI_CC(HCI_OP_READ=
_LOCAL_OOB_EXT_DATA, hci_cc_read_local_oob_ext_data,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3818  	       sizeof(stru=
ct hci_rp_read_local_oob_ext_data)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3819  	HCI_CC(HCI_OP_LE_R=
EAD_BUFFER_SIZE, hci_cc_le_read_buffer_size,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3820  	       sizeof(stru=
ct hci_rp_le_read_buffer_size)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3821  	HCI_CC(HCI_OP_LE_R=
EAD_LOCAL_FEATURES, hci_cc_le_read_local_features,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3822  	       sizeof(stru=
ct hci_rp_le_read_local_features)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3823  	HCI_CC(HCI_OP_LE_R=
EAD_ADV_TX_POWER, hci_cc_le_read_adv_tx_power,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3824  	       sizeof(stru=
ct hci_rp_le_read_adv_tx_power)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3825  	HCI_CC(HCI_OP_USER=
_CONFIRM_REPLY, hci_cc_user_confirm_reply,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3826  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3827  	HCI_CC(HCI_OP_USER=
_CONFIRM_NEG_REPLY, hci_cc_user_confirm_neg_reply,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3828  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3829  	HCI_CC(HCI_OP_USER=
_PASSKEY_REPLY, hci_cc_user_passkey_reply,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3830  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3831  	HCI_CC(HCI_OP_USER=
_PASSKEY_NEG_REPLY, hci_cc_user_passkey_neg_reply,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3832  	       sizeof(stru=
ct hci_rp_user_confirm_reply)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3833  	HCI_CC_STATUS(HCI_=
OP_LE_SET_RANDOM_ADDR, hci_cc_le_set_random_addr),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3834  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADV_ENABLE, hci_cc_le_set_adv_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3835  	HCI_CC_STATUS(HCI_=
OP_LE_SET_SCAN_PARAM, hci_cc_le_set_scan_param),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3836  	HCI_CC_STATUS(HCI_=
OP_LE_SET_SCAN_ENABLE, hci_cc_le_set_scan_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3837  	HCI_CC(HCI_OP_LE_R=
EAD_ACCEPT_LIST_SIZE,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3838  	       hci_cc_le_r=
ead_accept_list_size,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3839  	       sizeof(stru=
ct hci_rp_le_read_accept_list_size)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3840  	HCI_CC_STATUS(HCI_=
OP_LE_CLEAR_ACCEPT_LIST, hci_cc_le_clear_accept_list),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3841  	HCI_CC_STATUS(HCI_=
OP_LE_ADD_TO_ACCEPT_LIST,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3842  		      hci_cc_le_a=
dd_to_accept_list),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3843  	HCI_CC_STATUS(HCI_=
OP_LE_DEL_FROM_ACCEPT_LIST,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3844  		      hci_cc_le_d=
el_from_accept_list),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3845  	HCI_CC(HCI_OP_LE_R=
EAD_SUPPORTED_STATES, hci_cc_le_read_supported_states,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3846  	       sizeof(stru=
ct hci_rp_le_read_supported_states)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3847  	HCI_CC(HCI_OP_LE_R=
EAD_DEF_DATA_LEN, hci_cc_le_read_def_data_len,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3848  	       sizeof(stru=
ct hci_rp_le_read_def_data_len)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3849  	HCI_CC_STATUS(HCI_=
OP_LE_WRITE_DEF_DATA_LEN,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3850  		      hci_cc_le_w=
rite_def_data_len),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3851  	HCI_CC_STATUS(HCI_=
OP_LE_ADD_TO_RESOLV_LIST,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3852  		      hci_cc_le_a=
dd_to_resolv_list),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3853  	HCI_CC_STATUS(HCI_=
OP_LE_DEL_FROM_RESOLV_LIST,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3854  		      hci_cc_le_d=
el_from_resolv_list),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3855  	HCI_CC_STATUS(HCI_=
OP_LE_CLEAR_RESOLV_LIST,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3856  		      hci_cc_le_c=
lear_resolv_list),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3857  	HCI_CC(HCI_OP_LE_R=
EAD_RESOLV_LIST_SIZE, hci_cc_le_read_resolv_list_size,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3858  	       sizeof(stru=
ct hci_rp_le_read_resolv_list_size)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3859  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADDR_RESOLV_ENABLE,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3860  		      hci_cc_le_s=
et_addr_resolution_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3861  	HCI_CC(HCI_OP_LE_R=
EAD_MAX_DATA_LEN, hci_cc_le_read_max_data_len,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3862  	       sizeof(stru=
ct hci_rp_le_read_max_data_len)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3863  	HCI_CC_STATUS(HCI_=
OP_WRITE_LE_HOST_SUPPORTED,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3864  		      hci_cc_writ=
e_le_host_supported),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3865  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADV_PARAM, hci_cc_set_adv_param),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3866  	HCI_CC(HCI_OP_READ=
_RSSI, hci_cc_read_rssi,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3867  	       sizeof(stru=
ct hci_rp_read_rssi)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3868  	HCI_CC(HCI_OP_READ=
_TX_POWER, hci_cc_read_tx_power,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3869  	       sizeof(stru=
ct hci_rp_read_tx_power)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3870  	HCI_CC_STATUS(HCI_=
OP_WRITE_SSP_DEBUG_MODE, hci_cc_write_ssp_debug_mode),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3871  	HCI_CC_STATUS(HCI_=
OP_LE_SET_EXT_SCAN_PARAMS,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3872  		      hci_cc_le_s=
et_ext_scan_param),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3873  	HCI_CC_STATUS(HCI_=
OP_LE_SET_EXT_SCAN_ENABLE,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3874  		      hci_cc_le_s=
et_ext_scan_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3875  	HCI_CC_STATUS(HCI_=
OP_LE_SET_DEFAULT_PHY, hci_cc_le_set_default_phy),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3876  	HCI_CC(HCI_OP_LE_R=
EAD_NUM_SUPPORTED_ADV_SETS,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3877  	       hci_cc_le_r=
ead_num_adv_sets,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3878  	       sizeof(stru=
ct hci_rp_le_read_num_supported_adv_sets)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3879  	HCI_CC(HCI_OP_LE_S=
ET_EXT_ADV_PARAMS, hci_cc_set_ext_adv_param,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3880  	       sizeof(stru=
ct hci_rp_le_set_ext_adv_params)),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3881  	HCI_CC_STATUS(HCI_=
OP_LE_SET_EXT_ADV_ENABLE,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3882  		      hci_cc_le_s=
et_ext_adv_enable),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3883  	HCI_CC_STATUS(HCI_=
OP_LE_SET_ADV_SET_RAND_ADDR,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3884  		      hci_cc_le_s=
et_adv_set_random_addr),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3885  	HCI_CC_STATUS(HCI_=
OP_LE_REMOVE_ADV_SET, hci_cc_le_remove_adv_set),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3886  	HCI_CC_STATUS(HCI_=
OP_LE_CLEAR_ADV_SETS, hci_cc_le_clear_adv_sets),
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3887  	HCI_CC(HCI_OP_LE_R=
EAD_TRANSMIT_POWER, hci_cc_le_read_transmit_power,
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3888  	       sizeof(stru=
ct hci_rp_le_read_transmit_power))
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3889  };
c8992cffbe7411 Luiz Augusto von Dentz 2021-12-01  3890  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5045770846233057073==--

