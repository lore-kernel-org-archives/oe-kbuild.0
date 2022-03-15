Content-Type: multipart/mixed; boundary="===============8398432370426345562=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/bluetooth/hci_event.c:6979:21: warning: Excessive padding in 'struct hci_ev' (11 padding bytes, where 3 is optimal).
Date: Tue, 15 Mar 2022 14:54:15 +0800
Message-ID: <202203151414.UfDO1EXf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8398432370426345562==
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
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: 3e54c5890c87a30b1019a3de9dab968ff2b21e06 Bluetooth: hci_event: Use =
of a function table to handle HCI events
date:   3 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 3 months ago
config: riscv-randconfig-c006-20220310 (https://download.01.org/0day-ci/arc=
hive/20220315/202203151414.UfDO1EXf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca8=
7382b8f16a65bddac700202924228982f6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D3e54c5890c87a30b1019a3de9dab968ff2b21e06
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 3e54c5890c87a30b1019a3de9dab968ff2b21e06
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   Suppressed 2 warnings (2 in non-user code).
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
   4 warnings generated.
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c:223:8: warning: Although t=
he value stored to 'mc' is used in the enclosing expression, the value is n=
ever actually read from 'mc' [clang-analyzer-deadcode.DeadStores]
           if (!(mc =3D *pmc =3D kzalloc(sizeof(*mc), GFP_KERNEL)))
                 ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/nvkm/subdev/mc/base.c:223:8: note: Although the =
value stored to 'mc' is used in the enclosing expression, the value is neve=
r actually read from 'mc'
           if (!(mc =3D *pmc =3D kzalloc(sizeof(*mc), GFP_KERNEL)))
                 ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
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
   5 warnings generated.
   net/bluetooth/hci_core.c:890:2: warning: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(di.name, hdev->name);
           ^~~~~~
   net/bluetooth/hci_core.c:890:2: note: Call to function 'strcpy' is insec=
ure as it does not provide bounding of the memory buffer. Replace unbounded=
 copy functions with analogous functions that support length arguments such=
 as 'strlcpy'. CWE-119
           strcpy(di.name, hdev->name);
           ^~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   net/bluetooth/hci_conn.c:1878:18: warning: Value stored to 'hdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1878:18: note: Value stored to 'hdev' during it=
s initialization is never read
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1904:18: warning: Value stored to 'hdev' during=
 its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/hci_conn.c:1904:18: note: Value stored to 'hdev' during it=
s initialization is never read
           struct hci_dev *hdev =3D conn->hdev;
                           ^~~~   ~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
>> net/bluetooth/hci_event.c:6979:21: warning: Excessive padding in 'struct=
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
   net/bluetooth/hci_event.c:6979:21: note: Excessive padding in 'struct hc=
i_ev' (11 padding bytes, where 3 is optimal). Optimal fields order: , min_l=
en, max_len, req, consider reordering the fields or adding explicit padding=
 members
   static const struct hci_ev {
                ~~~~~~~^~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
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
   6 warnings generated.
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: warning: V=
alue stored to 'period' during its initialization is never read [clang-anal=
yzer-deadcode.DeadStores]
           uint32_t period =3D ts->period;
                    ^~~~~~   ~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:118:11: note: Valu=
e stored to 'period' during its initialization is never read
           uint32_t period =3D ts->period;
                    ^~~~~~   ~~~~~~~~~~
   include/linux/math64.h:28:24: warning: Division by zero [clang-analyzer-=
core.DivideZero]
           *remainder =3D dividend % divisor;
                                 ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:122:6: note: Assum=
ing 'fifo_nb' is not equal to 0
           if (fifo_nb =3D=3D 0)
               ^~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:122:2: note: Takin=
g false branch
           if (fifo_nb =3D=3D 0)
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:6: note: Assum=
ing field 'lo' is not equal to 0
           if (it->lo !=3D 0) {
               ^~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:130:2: note: Takin=
g true branch
           if (it->lo !=3D 0) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:133:11: note: Call=
ing 'inv_compute_chip_period'
                   valid =3D inv_compute_chip_period(ts, fifo_mult, period);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:101:2: note: Takin=
g false branch
           if (!inv_validate_period(period, mult))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:106:2: note: Calli=
ng 'inv_update_acc'
           inv_update_acc(&ts->chip_period, new_chip_period);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:6: note: Assumi=
ng the condition is false
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:30:2: note: Taking=
 false branch
           if (acc->idx >=3D ARRAY_SIZE(acc->values))
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:7: note: The va=
lue 0 is assigned to 'i'
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
                ^~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:34:2: note: Loop c=
ondition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(acc->values); ++i) {
           ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:7: note: Assumi=
ng the condition is true
                   if (acc->values[i] =3D=3D 0)
                       ^~~~~~~~~~~~~~~~~~~
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:35:3: note: Taking=
 true branch
                   if (acc->values[i] =3D=3D 0)
                   ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_timestamp.c:36:4: note:  Execu=
tion continues on line 40
                           break;

vim +6979 net/bluetooth/hci_event.c

3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6970  =

3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6971  #define HCI_EV_REQ(=
_op, _func, _len) \
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6972  	HCI_EV_REQ_VL(_op,=
 _func, _len, _len)
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6973  =

3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6974  /* Entries in this =
table shall have their position according to the event opcode
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6975   * they handle so t=
he use of the macros above is recommend since it does attempt
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6976   * to initialize at=
 its proper index using Designated Initializers that way
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6977   * events without a=
 callback function don't have entered.
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6978   */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01 @6979  static const struct=
 hci_ev {
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6980  	bool req;
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6981  	union {
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6982  		void (*func)(stru=
ct hci_dev *hdev, void *data,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6983  			     struct sk_b=
uff *skb);
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6984  		void (*func_req)(=
struct hci_dev *hdev, void *data,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6985  				 struct sk_buff=
 *skb, u16 *opcode, u8 *status,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6986  				 hci_req_comple=
te_t *req_complete,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6987  				 hci_req_comple=
te_skb_t *req_complete_skb);
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6988  	};
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6989  	u16  min_len;
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6990  	u16  max_len;
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6991  } hci_ev_table[U8_M=
AX + 1] =3D {
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6992  	/* [0x01 =3D HCI_E=
V_INQUIRY_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6993  	HCI_EV_STATUS(HCI_=
EV_INQUIRY_COMPLETE, hci_inquiry_complete_evt),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6994  	/* [0x02 =3D HCI_E=
V_INQUIRY_RESULT] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6995  	HCI_EV_VL(HCI_EV_I=
NQUIRY_RESULT, hci_inquiry_result_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6996  		  sizeof(struct h=
ci_ev_inquiry_result), HCI_MAX_EVENT_SIZE),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6997  	/* [0x03 =3D HCI_E=
V_CONN_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6998  	HCI_EV(HCI_EV_CONN=
_COMPLETE, hci_conn_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  6999  	       sizeof(stru=
ct hci_ev_conn_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7000  	/* [0x04 =3D HCI_E=
V_CONN_REQUEST] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7001  	HCI_EV(HCI_EV_CONN=
_REQUEST, hci_conn_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7002  	       sizeof(stru=
ct hci_ev_conn_request)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7003  	/* [0x05 =3D HCI_E=
V_DISCONN_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7004  	HCI_EV(HCI_EV_DISC=
ONN_COMPLETE, hci_disconn_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7005  	       sizeof(stru=
ct hci_ev_disconn_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7006  	/* [0x06 =3D HCI_E=
V_AUTH_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7007  	HCI_EV(HCI_EV_AUTH=
_COMPLETE, hci_auth_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7008  	       sizeof(stru=
ct hci_ev_auth_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7009  	/* [0x07 =3D HCI_E=
V_REMOTE_NAME] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7010  	HCI_EV(HCI_EV_REMO=
TE_NAME, hci_remote_name_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7011  	       sizeof(stru=
ct hci_ev_remote_name)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7012  	/* [0x08 =3D HCI_E=
V_ENCRYPT_CHANGE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7013  	HCI_EV(HCI_EV_ENCR=
YPT_CHANGE, hci_encrypt_change_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7014  	       sizeof(stru=
ct hci_ev_encrypt_change)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7015  	/* [0x09 =3D HCI_E=
V_CHANGE_LINK_KEY_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7016  	HCI_EV(HCI_EV_CHAN=
GE_LINK_KEY_COMPLETE,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7017  	       hci_change_=
link_key_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7018  	       sizeof(stru=
ct hci_ev_change_link_key_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7019  	/* [0x0b =3D HCI_E=
V_REMOTE_FEATURES] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7020  	HCI_EV(HCI_EV_REMO=
TE_FEATURES, hci_remote_features_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7021  	       sizeof(stru=
ct hci_ev_remote_features)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7022  	/* [0x0e =3D HCI_E=
V_CMD_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7023  	HCI_EV_REQ_VL(HCI_=
EV_CMD_COMPLETE, hci_cmd_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7024  		      sizeof(stru=
ct hci_ev_cmd_complete), HCI_MAX_EVENT_SIZE),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7025  	/* [0x0f =3D HCI_E=
V_CMD_STATUS] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7026  	HCI_EV_REQ(HCI_EV_=
CMD_STATUS, hci_cmd_status_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7027  		   sizeof(struct =
hci_ev_cmd_status)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7028  	/* [0x10 =3D HCI_E=
V_CMD_STATUS] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7029  	HCI_EV(HCI_EV_HARD=
WARE_ERROR, hci_hardware_error_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7030  	       sizeof(stru=
ct hci_ev_hardware_error)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7031  	/* [0x12 =3D HCI_E=
V_ROLE_CHANGE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7032  	HCI_EV(HCI_EV_ROLE=
_CHANGE, hci_role_change_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7033  	       sizeof(stru=
ct hci_ev_role_change)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7034  	/* [0x13 =3D HCI_E=
V_NUM_COMP_PKTS] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7035  	HCI_EV_VL(HCI_EV_N=
UM_COMP_PKTS, hci_num_comp_pkts_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7036  		  sizeof(struct h=
ci_ev_num_comp_pkts), HCI_MAX_EVENT_SIZE),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7037  	/* [0x14 =3D HCI_E=
V_MODE_CHANGE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7038  	HCI_EV(HCI_EV_MODE=
_CHANGE, hci_mode_change_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7039  	       sizeof(stru=
ct hci_ev_mode_change)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7040  	/* [0x16 =3D HCI_E=
V_PIN_CODE_REQ] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7041  	HCI_EV(HCI_EV_PIN_=
CODE_REQ, hci_pin_code_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7042  	       sizeof(stru=
ct hci_ev_pin_code_req)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7043  	/* [0x17 =3D HCI_E=
V_LINK_KEY_REQ] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7044  	HCI_EV(HCI_EV_LINK=
_KEY_REQ, hci_link_key_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7045  	       sizeof(stru=
ct hci_ev_link_key_req)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7046  	/* [0x18 =3D HCI_E=
V_LINK_KEY_NOTIFY] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7047  	HCI_EV(HCI_EV_LINK=
_KEY_NOTIFY, hci_link_key_notify_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7048  	       sizeof(stru=
ct hci_ev_link_key_notify)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7049  	/* [0x1c =3D HCI_E=
V_CLOCK_OFFSET] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7050  	HCI_EV(HCI_EV_CLOC=
K_OFFSET, hci_clock_offset_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7051  	       sizeof(stru=
ct hci_ev_clock_offset)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7052  	/* [0x1d =3D HCI_E=
V_PKT_TYPE_CHANGE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7053  	HCI_EV(HCI_EV_PKT_=
TYPE_CHANGE, hci_pkt_type_change_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7054  	       sizeof(stru=
ct hci_ev_pkt_type_change)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7055  	/* [0x20 =3D HCI_E=
V_PSCAN_REP_MODE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7056  	HCI_EV(HCI_EV_PSCA=
N_REP_MODE, hci_pscan_rep_mode_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7057  	       sizeof(stru=
ct hci_ev_pscan_rep_mode)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7058  	/* [0x22 =3D HCI_E=
V_INQUIRY_RESULT_WITH_RSSI] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7059  	HCI_EV_VL(HCI_EV_I=
NQUIRY_RESULT_WITH_RSSI,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7060  		  hci_inquiry_res=
ult_with_rssi_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7061  		  sizeof(struct h=
ci_ev_inquiry_result_rssi),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7062  		  HCI_MAX_EVENT_S=
IZE),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7063  	/* [0x23 =3D HCI_E=
V_REMOTE_EXT_FEATURES] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7064  	HCI_EV(HCI_EV_REMO=
TE_EXT_FEATURES, hci_remote_ext_features_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7065  	       sizeof(stru=
ct hci_ev_remote_ext_features)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7066  	/* [0x2c =3D HCI_E=
V_SYNC_CONN_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7067  	HCI_EV(HCI_EV_SYNC=
_CONN_COMPLETE, hci_sync_conn_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7068  	       sizeof(stru=
ct hci_ev_sync_conn_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7069  	/* [0x2d =3D HCI_E=
V_EXTENDED_INQUIRY_RESULT] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7070  	HCI_EV_VL(HCI_EV_E=
XTENDED_INQUIRY_RESULT,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7071  		  hci_extended_in=
quiry_result_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7072  		  sizeof(struct h=
ci_ev_ext_inquiry_result), HCI_MAX_EVENT_SIZE),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7073  	/* [0x30 =3D HCI_E=
V_KEY_REFRESH_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7074  	HCI_EV(HCI_EV_KEY_=
REFRESH_COMPLETE, hci_key_refresh_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7075  	       sizeof(stru=
ct hci_ev_key_refresh_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7076  	/* [0x31 =3D HCI_E=
V_IO_CAPA_REQUEST] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7077  	HCI_EV(HCI_EV_IO_C=
APA_REQUEST, hci_io_capa_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7078  	       sizeof(stru=
ct hci_ev_io_capa_request)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7079  	/* [0x32 =3D HCI_E=
V_IO_CAPA_REPLY] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7080  	HCI_EV(HCI_EV_IO_C=
APA_REPLY, hci_io_capa_reply_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7081  	       sizeof(stru=
ct hci_ev_io_capa_reply)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7082  	/* [0x33 =3D HCI_E=
V_USER_CONFIRM_REQUEST] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7083  	HCI_EV(HCI_EV_USER=
_CONFIRM_REQUEST, hci_user_confirm_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7084  	       sizeof(stru=
ct hci_ev_user_confirm_req)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7085  	/* [0x34 =3D HCI_E=
V_USER_PASSKEY_REQUEST] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7086  	HCI_EV(HCI_EV_USER=
_PASSKEY_REQUEST, hci_user_passkey_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7087  	       sizeof(stru=
ct hci_ev_user_passkey_req)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7088  	/* [0x35 =3D HCI_E=
V_REMOTE_OOB_DATA_REQUEST] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7089  	HCI_EV(HCI_EV_REMO=
TE_OOB_DATA_REQUEST, hci_remote_oob_data_request_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7090  	       sizeof(stru=
ct hci_ev_remote_oob_data_request)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7091  	/* [0x36 =3D HCI_E=
V_SIMPLE_PAIR_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7092  	HCI_EV(HCI_EV_SIMP=
LE_PAIR_COMPLETE, hci_simple_pair_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7093  	       sizeof(stru=
ct hci_ev_simple_pair_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7094  	/* [0x3b =3D HCI_E=
V_USER_PASSKEY_NOTIFY] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7095  	HCI_EV(HCI_EV_USER=
_PASSKEY_NOTIFY, hci_user_passkey_notify_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7096  	       sizeof(stru=
ct hci_ev_user_passkey_notify)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7097  	/* [0x3c =3D HCI_E=
V_KEYPRESS_NOTIFY] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7098  	HCI_EV(HCI_EV_KEYP=
RESS_NOTIFY, hci_keypress_notify_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7099  	       sizeof(stru=
ct hci_ev_keypress_notify)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7100  	/* [0x3d =3D HCI_E=
V_REMOTE_HOST_FEATURES] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7101  	HCI_EV(HCI_EV_REMO=
TE_HOST_FEATURES, hci_remote_host_features_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7102  	       sizeof(stru=
ct hci_ev_remote_host_features)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7103  	/* [0x3e =3D HCI_E=
V_LE_META] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7104  	HCI_EV_VL(HCI_EV_L=
E_META, hci_le_meta_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7105  		  sizeof(struct h=
ci_ev_le_meta), HCI_MAX_EVENT_SIZE),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7106  #if IS_ENABLED(CONF=
IG_BT_HS)
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7107  	/* [0x40 =3D HCI_E=
V_PHY_LINK_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7108  	HCI_EV(HCI_EV_PHY_=
LINK_COMPLETE, hci_phy_link_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7109  	       sizeof(stru=
ct hci_ev_phy_link_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7110  	/* [0x41 =3D HCI_E=
V_CHANNEL_SELECTED] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7111  	HCI_EV(HCI_EV_CHAN=
NEL_SELECTED, hci_chan_selected_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7112  	       sizeof(stru=
ct hci_ev_channel_selected)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7113  	/* [0x42 =3D HCI_E=
V_DISCONN_PHY_LINK_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7114  	HCI_EV(HCI_EV_DISC=
ONN_LOGICAL_LINK_COMPLETE,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7115  	       hci_disconn=
_loglink_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7116  	       sizeof(stru=
ct hci_ev_disconn_logical_link_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7117  	/* [0x45 =3D HCI_E=
V_LOGICAL_LINK_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7118  	HCI_EV(HCI_EV_LOGI=
CAL_LINK_COMPLETE, hci_loglink_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7119  	       sizeof(stru=
ct hci_ev_logical_link_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7120  	/* [0x46 =3D HCI_E=
V_DISCONN_LOGICAL_LINK_COMPLETE] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7121  	HCI_EV(HCI_EV_DISC=
ONN_PHY_LINK_COMPLETE,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7122  	       hci_disconn=
_phylink_complete_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7123  	       sizeof(stru=
ct hci_ev_disconn_phy_link_complete)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7124  #endif
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7125  	/* [0x48 =3D HCI_E=
V_NUM_COMP_BLOCKS] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7126  	HCI_EV(HCI_EV_NUM_=
COMP_BLOCKS, hci_num_comp_blocks_evt,
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7127  	       sizeof(stru=
ct hci_ev_num_comp_blocks)),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7128  	/* [0xff =3D HCI_E=
V_VENDOR] */
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7129  	HCI_EV(HCI_EV_VEND=
OR, msft_vendor_evt, 0),
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7130  };
3e54c5890c87a3 Luiz Augusto von Dentz 2021-12-01  7131  =


---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8398432370426345562==--

