Content-Type: multipart/mixed; boundary="===============5873198921243665962=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ls-zhu:shared_irq_v4 4/5] drivers/vdpa/ifcvf/ifcvf_main.c:49:4: warning: Called function pointer is null (null dereference) [clang-analyzer-core.CallAndMessage]
Date: Tue, 22 Feb 2022 09:34:15 +0800
Message-ID: <202202220921.4rPNwf1x-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5873198921243665962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Zhu Lingshan <lingshan.zhu@intel.com>

tree:   https://github.com/ls-zhu/linux shared_irq_v4
head:   779e67fb04b3f8ea466db8cc146cc09075c7ae4e
commit: 9587b3d164c2be41372d7c422058ffac3668ccb4 [4/5] vDPA/ifcvf: implemen=
t shared IRQ feature
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-c006-20220221 (https://download.01.org/0day-ci/arc=
hive/20220222/202202220921.4rPNwf1x-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/ls-zhu/linux/commit/9587b3d164c2be41372d7c4220=
58ffac3668ccb4
        git remote add ls-zhu https://github.com/ls-zhu/linux
        git fetch --no-tags ls-zhu shared_irq_v4
        git checkout 9587b3d164c2be41372d7c422058ffac3668ccb4
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^~~~~~
   net/bluetooth/hci_request.c:2190:6: warning: Branch condition evaluates =
to a garbage value [clang-analyzer-core.uninitialized.Branch]
           if (status) {
               ^~~~~~
   net/bluetooth/hci_request.c:2185:2: note: 'status' declared without an i=
nitial value
           u8 status;
           ^~~~~~~~~
   net/bluetooth/hci_request.c:2187:2: note: Taking false branch
           bt_dev_dbg(hdev, "");
           ^
   include/net/bluetooth/bluetooth.h:214:2: note: expanded from macro 'bt_d=
ev_dbg'
           BT_DBG("%s: " fmt, (hdev)->name, ##__VA_ARGS__)
           ^
   include/net/bluetooth/bluetooth.h:204:26: note: expanded from macro 'BT_=
DBG'
   #define BT_DBG(fmt, ...)        pr_debug(fmt "\n", ##__VA_ARGS__)
                                   ^
   include/linux/printk.h:576:2: note: expanded from macro 'pr_debug'
           no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:131:2: note: expanded from macro 'no_printk'
           if (0)                                          \
           ^
   net/bluetooth/hci_request.c:2189:2: note: Calling 'hci_req_sync'
           hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:203:6: note: Assuming the condition is false
           if (test_bit(HCI_UP, &hdev->flags))
               ^
   include/asm-generic/bitops/non-atomic.h:120:18: note: expanded from macr=
o 'test_bit'
   #define test_bit arch_test_bit
                    ^
   net/bluetooth/hci_request.c:203:2: note: Taking false branch
           if (test_bit(HCI_UP, &hdev->flags))
           ^
   net/bluetooth/hci_request.c:209:2: note: Returning without writing to '*=
hci_status'
           return ret;
           ^
   net/bluetooth/hci_request.c:2189:2: note: Returning from 'hci_req_sync'
           hci_req_sync(hdev, le_scan_restart, 0, HCI_CMD_TIMEOUT, &status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/bluetooth/hci_request.c:2190:6: note: Branch condition evaluates to =
a garbage value
           if (status) {
               ^~~~~~
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (5 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/rapidio/rio_cm.c:678:4: warning: Value stored to 'rc' is never r=
ead [clang-analyzer-deadcode.DeadStores]
                           rc =3D rio_add_outb_message(cm->mport, req->rdev=
, cmbox,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   drivers/rapidio/rio_cm.c:678:4: note: Value stored to 'rc' is never read
                           rc =3D rio_add_outb_message(cm->mport, req->rdev=
, cmbox,
                           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
>> drivers/vdpa/ifcvf/ifcvf_main.c:49:4: warning: Called function pointer i=
s null (null dereference) [clang-analyzer-core.CallAndMessage]
                           vf->vring->cb.callback(vring->cb.private);
                           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:61:6: note: Assuming the condition is fa=
lse
           if (isr & VIRTIO_PCI_ISR_CONFIG)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:61:2: note: Taking false branch
           if (isr & VIRTIO_PCI_ISR_CONFIG)
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:64:9: note: Calling 'ifcvf_vqs_reused_in=
tr_handler'
           return ifcvf_vqs_reused_intr_handler(irq, arg);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:46:14: note: Assuming 'i' is < field 'nr=
_vring'
           for (i =3D 0; i < vf->nr_vring; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:46:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < vf->nr_vring; i++) {
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:48:7: note: Assuming field 'callback' is=
 null
                   if (vring->cb.callback)
                       ^~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:48:3: note: Taking false branch
                   if (vring->cb.callback)
                   ^
   drivers/vdpa/ifcvf/ifcvf_main.c:46:14: note: Assuming 'i' is < field 'nr=
_vring'
           for (i =3D 0; i < vf->nr_vring; i++) {
                       ^~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:46:2: note: Loop condition is true.  Ent=
ering loop body
           for (i =3D 0; i < vf->nr_vring; i++) {
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:48:7: note: Assuming field 'callback' is=
 non-null
                   if (vring->cb.callback)
                       ^~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:48:3: note: Taking true branch
                   if (vring->cb.callback)
                   ^
   drivers/vdpa/ifcvf/ifcvf_main.c:49:4: note: Called function pointer is n=
ull (null dereference)
                           vf->vring->cb.callback(vring->cb.private);
                           ^~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:305:19: warning: 2nd function call argum=
ent is an uninitialized value [clang-analyzer-core.CallAndMessage]
           vf->config_irq =3D pci_irq_vector(pdev, config_vector);
                            ^
   drivers/vdpa/ifcvf/ifcvf_main.c:476:6: note: Assuming 'status_old' is no=
t equal to 'status'
           if (status_old =3D=3D status)
               ^~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:476:2: note: Taking false branch
           if (status_old =3D=3D status)
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:479:7: note: Assuming the condition is t=
rue
           if ((status & VIRTIO_CONFIG_S_DRIVER_OK) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:479:6: note: Left side of '&&' is true
           if ((status & VIRTIO_CONFIG_S_DRIVER_OK) &&
               ^
   drivers/vdpa/ifcvf/ifcvf_main.c:480:6: note: Assuming the condition is t=
rue
               !(status_old & VIRTIO_CONFIG_S_DRIVER_OK)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:479:2: note: Taking true branch
           if ((status & VIRTIO_CONFIG_S_DRIVER_OK) &&
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:481:9: note: Calling 'ifcvf_request_irq'
                   ret =3D ifcvf_request_irq(adapter);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:333:8: note: 'nvectors' is > 0
           if (!(nvectors > 0))
                 ^~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:333:2: note: Taking false branch
           if (!(nvectors > 0))
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:338:6: note: 'nvectors' is >=3D 'max_int=
r'
           if (nvectors < max_intr)
               ^~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:338:2: note: Taking false branch
           if (nvectors < max_intr)
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:341:6: note: Assuming 'nvectors' is not =
equal to 1
           if (nvectors =3D=3D 1) {
               ^~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:341:2: note: Taking false branch
           if (nvectors =3D=3D 1) {
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:349:6: note: Assuming 'ret' is 0
           if (ret)
               ^~~
   drivers/vdpa/ifcvf/ifcvf_main.c:349:2: note: Taking false branch
           if (ret)
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:352:8: note: Calling 'ifcvf_request_conf=
ig_irq'
           ret =3D ifcvf_request_config_irq(adapter);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:290:6: note: 'config_vector' declared wi=
thout an initial value
           int config_vector, ret;
               ^~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:292:6: note: Assuming field 'msix_vector=
_status' is not equal to MSIX_VECTOR_DEV_SHARED
           if (vf->msix_vector_status =3D=3D MSIX_VECTOR_DEV_SHARED)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:292:2: note: Taking false branch
           if (vf->msix_vector_status =3D=3D MSIX_VECTOR_DEV_SHARED)
           ^
   drivers/vdpa/ifcvf/ifcvf_main.c:295:6: note: Assuming field 'msix_vector=
_status' is not equal to MSIX_VECTOR_PER_VQ_AND_CONFIG
           if (vf->msix_vector_status =3D=3D MSIX_VECTOR_PER_VQ_AND_CONFIG)
--
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: warning: Value s=
tored to 'input' during its initialization is never read [clang-analyzer-de=
adcode.DeadStores]
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   drivers/misc/habanalabs/gaudi/gaudi_coresight.c:770:31: note: Value stor=
ed to 'input' during its initialization is never read
           struct hl_debug_params_spmu *input =3D params->input;
                                        ^~~~~   ~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/misc/habanalabs/common/debugfs.c:892:3: warning: Value stored to=
 'rc' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D pci_enable_device(hdev->pdev);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/misc/habanalabs/common/debugfs.c:892:3: note: Value stored to 'r=
c' is never read
                   rc =3D pci_enable_device(hdev->pdev);
                   ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/media/mc/mc-request.c:190:23: warning: Value stored to 'mdev' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   drivers/media/mc/mc-request.c:190:23: note: Value stored to 'mdev' durin=
g its initialization is never read
           struct media_device *mdev =3D req->mdev;
                                ^~~~   ~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> drivers/vdpa/ifcvf/ifcvf_base.c:30:40: warning: Value stored to 'cfg' du=
ring its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct virtio_pci_common_cfg __iomem *cfg =3D hw->common_cfg;
                                                 ^~~   ~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_base.c:30:40: note: Value stored to 'cfg' durin=
g its initialization is never read
           struct virtio_pci_common_cfg __iomem *cfg =3D hw->common_cfg;
                                                 ^~~   ~~~~~~~~~~~~~~
>> drivers/vdpa/ifcvf/ifcvf_base.c:346:2: warning: Value stored to 'ifcvf' =
is never read [clang-analyzer-deadcode.DeadStores]
           ifcvf =3D vf_to_adapter(hw);
           ^       ~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_base.c:346:2: note: Value stored to 'ifcvf' is =
never read
           ifcvf =3D vf_to_adapter(hw);
           ^       ~~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/mmc/host/tmio_mmc_core.c:929:17: warning: Value stored to 'dev' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   drivers/mmc/host/tmio_mmc_core.c:929:17: note: Value stored to 'dev' dur=
ing its initialization is never read
           struct device *dev =3D &host->pdev->dev;
                          ^~~   ~~~~~~~~~~~~~~~~
   Suppressed 10 warnings (2 in non-user code, 8 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/nvdimm/namespace_devs.c:107:20: warning: Value stored to 'nd_reg=
ion' during its initialization is never read [clang-analyzer-deadcode.DeadS=
tores]
           struct nd_region *nd_region =3D to_nd_region(dev->parent);
                             ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/namespace_devs.c:107:20: note: Value stored to 'nd_region=
' during its initialization is never read
           struct nd_region *nd_region =3D to_nd_region(dev->parent);
                             ^~~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvdimm/namespace_devs.c:108:30: warning: Value stored to 'ndns' =
during its initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct nd_namespace_common *ndns =3D to_ndns(dev);
                                       ^~~~   ~~~~~~~~~~~~
   drivers/nvdimm/namespace_devs.c:108:30: note: Value stored to 'ndns' dur=
ing its initialization is never read
           struct nd_namespace_common *ndns =3D to_ndns(dev);
                                       ^~~~   ~~~~~~~~~~~~
   drivers/nvdimm/namespace_devs.c:712:4: warning: Value stored to 'new_res=
' is never read [clang-analyzer-deadcode.DeadStores]
                           new_res =3D res;
                           ^         ~~~
   drivers/nvdimm/namespace_devs.c:712:4: note: Value stored to 'new_res' i=
s never read
                           new_res =3D res;
                           ^         ~~~
   drivers/nvdimm/namespace_devs.c:790:2: warning: Call to function 'strcat=
' is insecure as it does not provide bounding of the memory buffer. Replace=
 unbounded copy functions with analogous functions that support length argu=
ments such as 'strlcat'. CWE-119 [clang-analyzer-security.insecureAPI.strcp=
y]
           strcat(label_id.id, "pmem-reserve");
           ^~~~~~
   drivers/nvdimm/namespace_devs.c:790:2: note: Call to function 'strcat' i=
s insecure as it does not provide bounding of the memory buffer. Replace un=
bounded copy functions with analogous functions that support length argumen=
ts such as 'strlcat'. CWE-119
           strcat(label_id.id, "pmem-reserve");
           ^~~~~~
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   drivers/media/tuners/tuner-xc2028.c:1037:3: warning: Value stored to 'rc=
' is never read [clang-analyzer-deadcode.DeadStores]
                   rc =3D send_seq(priv, {0x00, 0x00});
                   ^
   drivers/media/tuners/tuner-xc2028.c:1037:3: note: Value stored to 'rc' i=
s never read
   Suppressed 10 warnings (3 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (2 in non-user code, 7 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   net/nfc/digital_dep.c:1199:3: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   rc =3D 0;
                   ^    ~
   net/nfc/digital_dep.c:1199:3: note: Value stored to 'rc' is never read
                   rc =3D 0;
                   ^    ~
   net/nfc/digital_dep.c:1407:3: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   rc =3D PTR_ERR(resp);
                   ^    ~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1407:3: note: Value stored to 'rc' is never read
                   rc =3D PTR_ERR(resp);
                   ^    ~~~~~~~~~~~~~
   net/nfc/digital_dep.c:1429:3: warning: Value stored to 'rc' is never rea=
d [clang-analyzer-deadcode.DeadStores]

vim +49 drivers/vdpa/ifcvf/ifcvf_main.c

5a2414bc454e89 drivers/virtio/vdpa/ifcvf/ifcvf_main.c Zhu Lingshan 2020-03-=
26  39  =

9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  40  static irqreturn_t ifcvf_vqs_reused_intr_handler(int irq, void *arg)
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  41  {
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  42  	struct ifcvf_hw *vf =3D arg;
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  43  	struct vring_info *vring;
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  44  	int i;
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  45  =

9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  46  	for (i =3D 0; i < vf->nr_vring; i++) {
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  47  		vring =3D &vf->vring[i];
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  48  		if (vring->cb.callback)
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17 @49  			vf->vring->cb.callback(vring->cb.private);
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  50  	}
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  51  =

9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  52  	return IRQ_HANDLED;
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  53  }
9587b3d164c2be drivers/vdpa/ifcvf/ifcvf_main.c        Zhu Lingshan 2022-02-=
17  54  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5873198921243665962==--

