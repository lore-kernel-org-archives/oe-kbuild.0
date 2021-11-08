Content-Type: multipart/mixed; boundary="===============5943377436326109971=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/bluetooth/hci_qca.c:1633:4: warning: Value stored to 'sw_ctrl_state' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 09 Nov 2021 00:40:53 +0800
Message-ID: <202111090050.vvdLHSqQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5943377436326109971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
CC: Marcel Holtmann <marcel@holtmann.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6b75d88fa81b122cce37ebf17428a849ccd3d0f1
commit: d8f97da1b92d2fe89d51c673ecf80c4016119e5c Bluetooth: hci_qca: Add su=
pport for QTI Bluetooth chip wcn6750
date:   5 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20211016 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a49f53=
86ce6b091da66ea7c3a1d9a588d53becf7)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dd8f97da1b92d2fe89d51c673ecf80c4016119e5c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d8f97da1b92d2fe89d51c673ecf80c4016119e5c
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   net/bluetooth/smp.c:1762:43: note: Left side of '&&' is false
           if (hci_dev_test_flag(hdev, HCI_SC_ONLY) && !(auth & SMP_AUTH_SC=
))
                                                    ^
   net/bluetooth/smp.c:1773:6: note: Assuming field 'oob_flag' is not equal=
 to SMP_OOB_PRESENT
           if (req->oob_flag =3D=3D SMP_OOB_PRESENT && SMP_DEV(hdev)->local=
_oob)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1773:39: note: Left side of '&&' is false
           if (req->oob_flag =3D=3D SMP_OOB_PRESENT && SMP_DEV(hdev)->local=
_oob)
                                                ^
   net/bluetooth/smp.c:1777:6: note: Assuming field 'type' is not equal to =
ACL_LINK
           if (conn->hcon->type =3D=3D ACL_LINK) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1777:2: note: Taking false branch
           if (conn->hcon->type =3D=3D ACL_LINK) {
           ^
   net/bluetooth/smp.c:1807:6: note: Assuming the condition is false
           if (rsp.auth_req & SMP_AUTH_SC) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1807:2: note: Taking false branch
           if (rsp.auth_req & SMP_AUTH_SC) {
           ^
   net/bluetooth/smp.c:1814:6: note: Assuming field 'io_capability' is not =
equal to HCI_IO_NO_INPUT_OUTPUT
           if (conn->hcon->io_capability =3D=3D HCI_IO_NO_INPUT_OUTPUT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1814:2: note: Taking false branch
           if (conn->hcon->io_capability =3D=3D HCI_IO_NO_INPUT_OUTPUT)
           ^
   net/bluetooth/smp.c:1819:6: note: Assuming 'sec_level' is <=3D field 'pe=
nding_sec_level'
           if (sec_level > conn->hcon->pending_sec_level)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1819:2: note: Taking false branch
           if (sec_level > conn->hcon->pending_sec_level)
           ^
   net/bluetooth/smp.c:1823:6: note: Assuming field 'pending_sec_level' is =
< BT_SECURITY_HIGH
           if (conn->hcon->pending_sec_level >=3D BT_SECURITY_HIGH) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1823:2: note: Taking false branch
           if (conn->hcon->pending_sec_level >=3D BT_SECURITY_HIGH) {
           ^
   net/bluetooth/smp.c:1832:13: note: Assuming '__UNIQUE_ID___x638' is >=3D=
 '__UNIQUE_ID___y639'
           key_size =3D min(req->max_key_size, rsp.max_key_size);
                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^~~~~~~~~~
   net/bluetooth/smp.c:1832:13: note: '?' condition is false
           key_size =3D min(req->max_key_size, rsp.max_key_size);
                      ^
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:38:3: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ^
   include/linux/minmax.h:33:3: note: expanded from macro '__cmp_once'
                   __cmp(unique_x, unique_y, op); })
                   ^
   include/linux/minmax.h:28:26: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                            ^
   net/bluetooth/smp.c:1833:2: note: Taking false branch
           if (check_enc_key_size(conn, key_size))
           ^
   net/bluetooth/smp.c:1852:6: note: Assuming the condition is false
           if (test_bit(SMP_FLAG_SC, &smp->flags)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:1852:2: note: Taking false branch
           if (test_bit(SMP_FLAG_SC, &smp->flags)) {
           ^
   net/bluetooth/smp.c:1861:8: note: Calling 'tk_request'
           ret =3D tk_request(conn, 0, auth, rsp.io_capability, req->io_cap=
ability);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   net/bluetooth/smp.c:859:2: note: Null pointer passed as 1st argument to =
memory set function
           memset(smp->tk, 0, sizeof(smp->tk));
           ^      ~~~~~~~
   net/bluetooth/smp.c:1498:18: warning: Value stored to 'hdev' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct hci_dev *hdev =3D hcon->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/smp.c:1498:18: note: Value stored to 'hdev' during its ini=
tialization is never read
           struct hci_dev *hdev =3D hcon->hdev;
                           ^~~~   ~~~~~~~~~~
   net/bluetooth/smp.c:2933:34: warning: Value stored to 'kp' during its in=
itialization is never read [clang-analyzer-deadcode.DeadStores]
           struct smp_cmd_keypress_notify *kp =3D (void *) skb->data;
                                           ^~   ~~~~~~~~~~~~~~~~~~
   net/bluetooth/smp.c:2933:34: note: Value stored to 'kp' during its initi=
alization is never read
           struct smp_cmd_keypress_notify *kp =3D (void *) skb->data;
                                           ^~   ~~~~~~~~~~~~~~~~~~
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   14 warnings generated.
>> drivers/bluetooth/hci_qca.c:1633:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1633:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
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
   8 warnings generated.
   drivers/hid/hid-core.c:1335:24: warning: The result of the left shift is=
 undefined due to shifting by '4294967295', which is greater or equal to th=
e width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorResult]
                   return value < 0 ? 1 << (n - 1) : (1 << (n - 1)) - 1;
                                        ^
   drivers/hid/hid-core.c:1717:6: note: Assuming 'buf' is non-null
           if (!buf)
               ^~~~
   drivers/hid/hid-core.c:1717:2: note: Taking false branch
           if (!buf)
           ^
   drivers/hid/hid-core.c:1722:6: note: Assuming 'reqtype' is equal to HID_=
REQ_SET_REPORT
           if (reqtype =3D=3D HID_REQ_SET_REPORT)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1722:2: note: Taking true branch
           if (reqtype =3D=3D HID_REQ_SET_REPORT)
           ^
   drivers/hid/hid-core.c:1723:3: note: Calling 'hid_output_report'
                   hid_output_report(report, buf);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1630:14: note: Field 'id' is <=3D 0
           if (report->id > 0)
                       ^
   drivers/hid/hid-core.c:1630:2: note: Taking false branch
           if (report->id > 0)
           ^
   drivers/hid/hid-core.c:1634:14: note: Assuming 'n' is < field 'maxfield'
           for (n =3D 0; n < report->maxfield; n++)
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1634:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < report->maxfield; n++)
           ^
   drivers/hid/hid-core.c:1635:3: note: Calling 'hid_output_field'
                   hid_output_field(report->device, report->field[n], data);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1600:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1600:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1601:7: note: Assuming field 'logical_minimum' is=
 < 0
                   if (field->logical_minimum < 0) /* signed values */
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1601:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1600:14: note: Assuming 'n' is < 'count'
           for (n =3D 0; n < count; n++) {
                       ^~~~~~~~~
   drivers/hid/hid-core.c:1600:2: note: Loop condition is true.  Entering l=
oop body
           for (n =3D 0; n < count; n++) {
           ^
   drivers/hid/hid-core.c:1601:14: note: Field 'logical_minimum' is < 0
                   if (field->logical_minimum < 0) /* signed values */
                              ^
   drivers/hid/hid-core.c:1601:3: note: Taking true branch
                   if (field->logical_minimum < 0) /* signed values */
                   ^
   drivers/hid/hid-core.c:1603:7: note: Calling 's32ton'
                                     s32ton(field->value[n], size));
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hid/hid-core.c:1334:6: note: Assuming 'a' is not equal to 0
           if (a && a !=3D -1)
               ^
   drivers/hid/hid-core.c:1334:6: note: Left side of '&&' is true
   drivers/hid/hid-core.c:1334:11: note: Assuming the condition is true
           if (a && a !=3D -1)
                    ^~~~~~~
   drivers/hid/hid-core.c:1334:2: note: Taking true branch
           if (a && a !=3D -1)
           ^
   drivers/hid/hid-core.c:1335:10: note: Assuming 'value' is < 0
--
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
   6 warnings generated.
   9 warnings generated.
   12 warnings generated.
   15 warnings generated.
   18 warnings generated.
   21 warnings generated.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
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
   6 warnings generated.
   9 warnings generated.
   12 warnings generated.
   15 warnings generated.
   18 warnings generated.
   21 warnings generated.
   24 warnings generated.
   Suppressed 24 warnings (24 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/mtdcore.c:658:3: warning: Value stored to 'error' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                   error =3D 0;
                   ^       ~
   drivers/mtd/mtdcore.c:658:3: note: Value stored to 'error' is never read
                   error =3D 0;
                   ^       ~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/mtd/mtdsuper.c:27:19: warning: Value stored to 'mtd' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct mtd_info *mtd =3D fc->sget_key;
                            ^~~   ~~~~~~~~~~~~
   drivers/mtd/mtdsuper.c:27:19: note: Value stored to 'mtd' during its ini=
tialization is never read
           struct mtd_info *mtd =3D fc->sget_key;
                            ^~~   ~~~~~~~~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   drivers/mtd/mtdconcat.c:67:4: warning: Value stored to 'size' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:67:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:159:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: warning: Value stored to 'size' is never =
read [clang-analyzer-deadcode.DeadStores]
                           size =3D 0;
                           ^      ~
   drivers/mtd/mtdconcat.c:492:4: note: Value stored to 'size' is never read
                           size =3D 0;
                           ^      ~
   Suppressed 3 warnings (3 in non-user code).
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
   7 warnings generated.
   14 warnings generated.
>> drivers/bluetooth/hci_qca.c:1633:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1633:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: warning: Value stored to 'sw_ctrl_st=
ate' is never read [clang-analyzer-deadcode.DeadStores]
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   drivers/bluetooth/hci_qca.c:1911:4: note: Value stored to 'sw_ctrl_state=
' is never read
                           sw_ctrl_state =3D gpiod_get_value_cansleep(qcade=
v->sw_ctrl);
                           ^               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   net/ipv4/tcp_timer.c:484:21: warning: Value stored to 'inet' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
                   struct inet_sock *inet =3D inet_sk(sk);
                                     ^~~~   ~~~~~~~~~~~
   net/ipv4/tcp_timer.c:484:21: note: Value stored to 'inet' during its ini=
tialization is never read
                   struct inet_sock *inet =3D inet_sk(sk);
                                     ^~~~   ~~~~~~~~~~~
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
   7 warnings generated.
   drivers/greybus/svc.c:1144:2: warning: Value stored to 'reset' is never =
read [clang-analyzer-deadcode.DeadStores]
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1144:2: note: Value stored to 'reset' is never read
           reset =3D request->payload;
           ^       ~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1162:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1181:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1181:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1214:2: warning: Value stored to 'request' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
   drivers/greybus/svc.c:1214:2: note: Value stored to 'request' is never r=
ead
           request =3D op->request->payload;
           ^         ~~~~~~~~~~~~~~~~~~~~
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

vim +/sw_ctrl_state +1633 drivers/bluetooth/hci_qca.c

c1a74160eaf1ac Venkata Lakshmi Narayana Gubba 2021-03-11  1593  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1594  static int =
qca_regulator_init(struct hci_uart *hu)
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1595  {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1596  	enum qca_b=
tsoc_type soc_type =3D qca_soc_type(hu);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1597  	struct qca=
_serdev *qcadev;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1598  	int ret;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1599  	bool sw_ct=
rl_state;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1600  =

3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1601  	/* Check f=
or vregs status, may be hci down has turned
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1602  	 * off the=
 voltage regulator.
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1603  	 */
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1604  	qcadev =3D=
 serdev_device_get_drvdata(hu->serdev);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1605  	if (!qcade=
v->bt_power->vregs_on) {
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1606  		serdev_de=
vice_close(hu->serdev);
a9314e76da966d Bjorn Andersson                2019-10-17  1607  		ret =3D q=
ca_regulator_enable(qcadev);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1608  		if (ret)
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1609  			return r=
et;
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1610  =

3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1611  		ret =3D s=
erdev_device_open(hu->serdev);
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1612  		if (ret) {
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1613  			bt_dev_e=
rr(hu->hdev, "failed to open port");
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1614  			return r=
et;
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1615  		}
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1616  	}
3e4be65eb82c84 Balakrishna Godavarthi         2018-09-24  1617  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1618  	if (qca_is=
_wcn399x(soc_type)) {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1619  		/* Forcef=
ully enable wcn399x to enter in to boot mode. */
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1620  		host_set_=
baudrate(hu, 2400);
9836b80208b225 Matthias Kaehlcke              2019-02-26  1621  		ret =3D q=
ca_send_power_pulse(hu, false);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1622  		if (ret)
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1623  			return r=
et;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1624  	}
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1625  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1626  	/* For wcn=
6750 need to enable gpio bt_en */
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1627  	if (qcadev=
->bt_en) {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1628  		gpiod_set=
_value_cansleep(qcadev->bt_en, 0);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1629  		msleep(50=
);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1630  		gpiod_set=
_value_cansleep(qcadev->bt_en, 1);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1631  		msleep(50=
);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1632  		if (qcade=
v->sw_ctrl) {
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18 @1633  			sw_ctrl_=
state =3D gpiod_get_value_cansleep(qcadev->sw_ctrl);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1634  			bt_dev_d=
bg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1635  		}
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1636  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1637  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1638  	qca_set_sp=
eed(hu, QCA_INIT_SPEED);
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1639  =

d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1640  	if (qca_is=
_wcn399x(soc_type)) {
9836b80208b225 Matthias Kaehlcke              2019-02-26  1641  		ret =3D q=
ca_send_power_pulse(hu, true);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1642  		if (ret)
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1643  			return r=
et;
d8f97da1b92d2f Venkata Lakshmi Narayana Gubba 2021-05-18  1644  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1645  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1646  	/* Now the=
 device is in ready state to communicate with host.
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1647  	 * To sync=
 host with device we need to reopen port.
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1648  	 * Without=
 this, we will have RTS and CTS synchronization
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1649  	 * issues.
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1650  	 */
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1651  	serdev_dev=
ice_close(hu->serdev);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1652  	ret =3D se=
rdev_device_open(hu->serdev);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1653  	if (ret) {
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1654  		bt_dev_er=
r(hu->hdev, "failed to open port");
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1655  		return re=
t;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1656  	}
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1657  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1658  	hci_uart_s=
et_flow_control(hu, false);
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1659  =

fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1660  	return 0;
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1661  }
fa9ad876b8e0eb Balakrishna Godavarthi         2018-08-03  1662  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5943377436326109971==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============5943377436326109971==--

