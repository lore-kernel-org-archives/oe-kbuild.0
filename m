Content-Type: multipart/mixed; boundary="===============2254561110890094125=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 900/9128] drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: warning: Value stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 27 Feb 2022 12:45:28 +0800
Message-ID: <202202271212.CeGqCU0L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2254561110890094125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jonathan Marek <jonathan@marek.ca>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Julian Grahsl <jgrahsl@snap.com>
CC: Robert Foss <robert.foss@linaro.org>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: b4436a18eedb8d93e148d009b145b4ae142e6f9d [900/9128] media: camss: a=
dd support for SM8250 camss
:::::: branch date: 27 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220222 (https://download.01.org/0day-ci/arc=
hive/20220227/202202271212.CeGqCU0L-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db4436a18eedb8d93e148d009b145b4ae142e6f9d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b4436a18eedb8d93e148d009b145b4ae142e6f9d
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                                   ^
   mm/memblock.c:1177:9: note: Assuming 'out_end' is null
                                   if (out_end)
                                       ^~~~~~~
   mm/memblock.c:1177:5: note: Taking false branch
                                   if (out_end)
                                   ^
   mm/memblock.c:1179:9: note: Assuming 'out_nid' is null
                                   if (out_nid)
                                       ^~~~~~~
   mm/memblock.c:1179:5: note: Taking false branch
                                   if (out_nid)
                                   ^
   mm/memblock.c:1181:9: note: 'm_start' is >=3D 'r_start'
                                   if (m_start >=3D r_start)
                                       ^~~~~~~
   mm/memblock.c:1181:5: note: Taking true branch
                                   if (m_start >=3D r_start)
                                   ^
   mm/memblock.c:1185:36: note: The result of the '<<' expression is undefi=
ned
                                   *idx =3D (u32)idx_a | (u64)idx_b << 32;
                                                       ~~~~~~~~~~~^~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   drivers/scsi/scsi_logging.c:75:3: warning: Value stored to 'off' is neve=
r read [clang-analyzer-deadcode.DeadStores]
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:75:3: note: Value stored to 'off' is never r=
ead
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:100:3: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:100:3: note: Value stored to 'off' is never =
read
                   off +=3D vscnprintf(logbuf + off, logbuf_len - off, fmt,=
 args);
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
   drivers/scsi/scsi_logging.c:209:3: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
                   off +=3D scnprintf(logbuf + off, logbuf_len - off, "\n");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:209:3: note: Value stored to 'off' is never =
read
                   off +=3D scnprintf(logbuf + off, logbuf_len - off, "\n");
                   ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:331:2: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           off +=3D scsi_format_sense_hdr(logbuf + off, logbuf_len - off, s=
shdr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/scsi_logging.c:331:2: note: Value stored to 'off' is never =
read
           off +=3D scsi_format_sense_hdr(logbuf + off, logbuf_len - off, s=
shdr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   drivers/scsi/scsi_logging.c:339:2: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           off +=3D scsi_format_extd_sense(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:339:2: note: Value stored to 'off' is never =
read
           off +=3D scsi_format_extd_sense(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:435:2: warning: Value stored to 'off' is nev=
er read [clang-analyzer-deadcode.DeadStores]
           off +=3D scnprintf(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/scsi_logging.c:435:2: note: Value stored to 'off' is never =
read
           off +=3D scnprintf(logbuf + off, logbuf_len - off,
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
   drivers/mfd/tps65010.c:650:5: warning: Value stored to 'status' is never=
 read [clang-analyzer-deadcode.DeadStores]
                                   status =3D 0;
                                   ^        ~
   drivers/mfd/tps65010.c:650:5: note: Value stored to 'status' is never re=
ad
                                   status =3D 0;
                                   ^        ~
   Suppressed 6 warnings (6 in non-user code).
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
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: warning: Valu=
e stored to 'val' is never read [clang-analyzer-deadcode.DeadStores]
                   val =3D 0;
                   ^     ~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3: note: Value s=
tored to 'val' is never read
                   val =3D 0;
                   ^     ~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: warning: Valu=
e stored to 'hw_gen' is never read [clang-analyzer-deadcode.DeadStores]
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:484:2: note: Value s=
tored to 'hw_gen' is never read
           hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & 0xF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:485:2: warning: Valu=
e stored to 'hw_rev' is never read [clang-analyzer-deadcode.DeadStores]
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:485:2: note: Value s=
tored to 'hw_rev' is never read
           hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0xFFF;
           ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/qcom/camss/camss-csid-gen2.c:486:2: warning: Valu=
e stored to 'hw_step' is never read [clang-analyzer-deadcode.DeadStores]
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/qcom/camss/camss-csid-gen2.c:486:2: note: Value s=
tored to 'hw_step' is never read
           hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   drivers/vfio/pci/vfio_pci_intrs.c:301:6: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
           if (vdev->ctx[vector].trigger) {
               ^
   drivers/vfio/pci/vfio_pci_intrs.c:646:2: note: Control jumps to 'case VF=
IO_PCI_MSI_IRQ_INDEX:'  at line 660
           switch (index) {
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:662:3: note: Control jumps to 'case 32=
:'  at line 667
                   switch (flags & VFIO_IRQ_SET_ACTION_TYPE_MASK) {
                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:669:4: note:  Execution continues on l=
ine 671
                           break;
                           ^
   drivers/vfio/pci/vfio_pci_intrs.c:671:3: note:  Execution continues on l=
ine 689
                   break;
                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:689:7: note: 'func' is non-null
           if (!func)
                ^~~~
   drivers/vfio/pci/vfio_pci_intrs.c:689:2: note: Taking false branch
           if (!func)
           ^
   drivers/vfio/pci/vfio_pci_intrs.c:692:9: note: Calling 'vfio_pci_set_msi=
_trigger'
           return func(vdev, index, start, count, flags, data);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:515:15: note: 'index' is not equal to =
VFIO_PCI_MSIX_IRQ_INDEX
           bool msix =3D (index =3D=3D VFIO_PCI_MSIX_IRQ_INDEX) ? true : fa=
lse;
                        ^~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:515:14: note: '?' condition is false
           bool msix =3D (index =3D=3D VFIO_PCI_MSIX_IRQ_INDEX) ? true : fa=
lse;
                       ^
   drivers/vfio/pci/vfio_pci_intrs.c:517:13: note: Assuming 'index' is not =
equal to field 'irq_type'
           if (irq_is(vdev, index) && !count && (flags & VFIO_IRQ_SET_DATA_=
NONE)) {
                      ^
   include/linux/vfio_pci_core.h:146:29: note: expanded from macro 'irq_is'
   #define irq_is(vdev, type) (vdev->irq_type =3D=3D type)
                               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:517:26: note: Left side of '&&' is fal=
se
           if (irq_is(vdev, index) && !count && (flags & VFIO_IRQ_SET_DATA_=
NONE)) {
                                   ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:21: note: 'index' is not equal to =
field 'irq_type'
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                              ^
   include/linux/vfio_pci_core.h:146:47: note: expanded from macro 'irq_is'
   #define irq_is(vdev, type) (vdev->irq_type =3D=3D type)
                                                 ^~~~
   drivers/vfio/pci/vfio_pci_intrs.c:522:8: note: Left side of '||' is false
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                 ^
   include/linux/vfio_pci_core.h:146:28: note: expanded from macro 'irq_is'
   #define irq_is(vdev, type) (vdev->irq_type =3D=3D type)
                              ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:43: note: Assuming field 'irq_type=
' is not equal to VFIO_PCI_INTX_IRQ_INDEX
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                                    ^
   include/linux/vfio_pci_core.h:145:38: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                ~~~~~~~~^~~~~
   include/linux/vfio_pci_core.h:142:24: note: expanded from macro 'is_intx'
   #define is_intx(vdev) (vdev->irq_type =3D=3D VFIO_PCI_INTX_IRQ_INDEX)
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/vfio/pci/vfio_pci_intrs.c:522:31: note: Left side of '||' is fal=
se
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                        ^
   include/linux/vfio_pci_core.h:145:30: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                ^
   include/linux/vfio_pci_core.h:142:23: note: expanded from macro 'is_intx'
   #define is_intx(vdev) (vdev->irq_type =3D=3D VFIO_PCI_INTX_IRQ_INDEX)
                         ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:31: note: Field 'irq_type' is not =
equal to VFIO_PCI_MSI_IRQ_INDEX
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                        ^
   include/linux/vfio_pci_core.h:145:47: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                                 ^
   include/linux/vfio_pci_core.h:143:29: note: expanded from macro 'is_msi'
   #define is_msi(vdev) (vdev->irq_type =3D=3D VFIO_PCI_MSI_IRQ_INDEX)
                               ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:31: note: Left side of '||' is fal=
se
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                        ^
   include/linux/vfio_pci_core.h:145:30: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))
                                ^
   include/linux/vfio_pci_core.h:142:23: note: expanded from macro 'is_intx'
   #define is_intx(vdev) (vdev->irq_type =3D=3D VFIO_PCI_INTX_IRQ_INDEX)
                         ^
   drivers/vfio/pci/vfio_pci_intrs.c:522:43: note: Assuming field 'irq_type=
' is not equal to VFIO_PCI_MSIX_IRQ_INDEX
           if (!(irq_is(vdev, index) || is_irq_none(vdev)))
                                                    ^
   include/linux/vfio_pci_core.h:145:71: note: expanded from macro 'is_irq_=
none'
   #define is_irq_none(vdev) (!(is_intx(vdev) || is_msi(vdev) || is_msix(vd=
ev)))

vim +/val +407 drivers/media/platform/qcom/camss/camss-csid-gen2.c

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  336  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  337  static void csid_configure_stream(struct csid_device=
 *csid, u8 enable)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  338  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  339  	struct csid_testgen_config *tg =3D &csid->testgen;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  340  	u32 val;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  341  	u32 phy_sel =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  342  	u8 lane_cnt =3D csid->phy.lane_cnt;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  343  	struct v4l2_mbus_framefmt *input_format =3D &csid->=
fmt[MSM_CSID_PAD_SRC];
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  344  	const struct csid_format *format =3D csid_get_fmt_e=
ntry(csid->formats, csid->nformats,
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  345  							      input_format->code);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  346  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  347  	if (!lane_cnt)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  348  		lane_cnt =3D 4;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  349  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  350  	if (!tg->enabled)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  351  		phy_sel =3D csid->phy.csiphy_id;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  352  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  353  	if (enable) {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  354  		u8 vc =3D 0; /* Virtual Channel 0 */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  355  		u8 dt_id =3D vc * 4;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  356  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  357  		if (tg->enabled) {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  358  			/* Config Test Generator */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  359  			vc =3D 0xa;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  360  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  361  			/* configure one DT, infinite frames */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  362  			val =3D vc << TPG_VC_CFG0_VC_NUM;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  363  			val |=3D INTELEAVING_MODE_ONE_SHOT << TPG_VC_CFG0=
_LINE_INTERLEAVING_MODE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  364  			val |=3D 0 << TPG_VC_CFG0_NUM_FRAMES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  365  			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG0=
);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  366  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  367  			val =3D 0x740 << TPG_VC_CFG1_H_BLANKING_COUNT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  368  			val |=3D 0x3ff << TPG_VC_CFG1_V_BLANKING_COUNT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  369  			writel_relaxed(val, csid->base + CSID_TPG_VC_CFG1=
);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  370  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  371  			writel_relaxed(0x12345678, csid->base + CSID_TPG_=
LFSR_SEED);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  372  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  373  			val =3D input_format->height & 0x1fff << TPG_DT_n=
_CFG_0_FRAME_HEIGHT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  374  			val |=3D input_format->width & 0x1fff << TPG_DT_n=
_CFG_0_FRAME_WIDTH;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  375  			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CF=
G_0(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  376  =

14d510e040f85f drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  377  			val =3D format->data_type << TPG_DT_n_CFG_1_DATA_=
TYPE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  378  			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CF=
G_1(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  379  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  380  			val =3D tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  381  			val |=3D 0xBE << TPG_DT_n_CFG_2_USER_SPECIFIED_PA=
YLOAD;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  382  			val |=3D format->decode_format << TPG_DT_n_CFG_2_=
ENCODE_FORMAT;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  383  			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CF=
G_2(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  384  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  385  			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BAR=
S_CFG);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  386  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  387  			writel_relaxed(0, csid->base + CSID_TPG_COLOR_BOX=
_CFG);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  388  		}
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  389  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  390  		val =3D 1 << RDI_CFG0_BYTE_CNTR_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  391  		val |=3D 1 << RDI_CFG0_FORMAT_MEASURE_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  392  		val |=3D 1 << RDI_CFG0_TIMESTAMP_EN;
14d510e040f85f drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  393  		/* note: for non-RDI path, this should be format->=
decode_format */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  394  		val |=3D DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DE=
CODE_FORMAT;
14d510e040f85f drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  395  		val |=3D format->data_type << RDI_CFG0_DATA_TYPE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  396  		val |=3D vc << RDI_CFG0_VIRTUAL_CHANNEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  397  		val |=3D dt_id << RDI_CFG0_DT_ID;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  398  		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  399  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  400  		/* CSID_TIMESTAMP_STB_POST_IRQ */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  401  		val =3D 2 << RDI_CFG1_TIMESTAMP_STB_SEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  402  		writel_relaxed(val, csid->base + CSID_RDI_CFG1(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  403  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  404  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  405  		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP=
_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  406  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @407  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  408  		writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_P=
ATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  409  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  410  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  411  		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBS=
AMPLE_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  412  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  413  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  414  		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBS=
AMPLE_PATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  415  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  416  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  417  		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_=
DROP_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  418  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  419  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  420  		writel_relaxed(val, csid->base + CSID_RDI_RPP_PIX_=
DROP_PATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  421  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  422  		val =3D 1;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  423  		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE=
_DROP_PERIOD(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  424  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  425  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  426  		writel_relaxed(val, csid->base + CSID_RDI_RPP_LINE=
_DROP_PATTERN(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  427  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  428  		val =3D 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  429  		writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  430  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  431  		val =3D readl_relaxed(csid->base + CSID_RDI_CFG0(0=
));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  432  		val |=3D  1 << RDI_CFG0_ENABLE;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  433  		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  434  	}
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  435  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  436  	if (tg->enabled) {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  437  		val =3D enable << TPG_CTRL_TEST_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  438  		val |=3D 1 << TPG_CTRL_FS_PKT_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  439  		val |=3D 1 << TPG_CTRL_FE_PKT_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  440  		val |=3D (lane_cnt - 1) << TPG_CTRL_NUM_ACTIVE_LAN=
ES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  441  		val |=3D 0x64 << TPG_CTRL_CYCLES_BETWEEN_PKTS;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  442  		val |=3D 0xA << TPG_CTRL_NUM_TRAIL_BYTES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  443  		writel_relaxed(val, csid->base + CSID_TPG_CTRL);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  444  	}
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  445  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  446  	val =3D (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_L=
ANES;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  447  	val |=3D csid->phy.lane_assign << CSI2_RX_CFG0_DL0_=
INPUT_SEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  448  	val |=3D phy_sel << CSI2_RX_CFG0_PHY_NUM_SEL;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  449  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG0);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  450  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  451  	val =3D 1 << CSI2_RX_CFG1_PACKET_ECC_CORRECTION_EN;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  452  	val |=3D 1 << CSI2_RX_CFG1_MISR_EN;
7d8210851cb3db drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  453  	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  454  =

ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  455  	if (enable)
ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  456  		val =3D HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_C=
TRL_HALT_CMD;
ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  457  	else
ee780cd7be3b56 drivers/media/platform/qcom/camss/camss-csid-170.c Jonathan =
Marek 2021-12-22  458  		val =3D HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTR=
L_HALT_CMD;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  459  	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  460  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  461  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  462  static int csid_configure_testgen_pattern(struct csi=
d_device *csid, s32 val)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  463  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  464  	if (val > 0 && val <=3D csid->testgen.nmodes)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  465  		csid->testgen.mode =3D val;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  466  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  467  	return 0;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  468  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  469  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  470  /*
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  471   * csid_hw_version - CSID hardware version query
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  472   * @csid: CSID device
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  473   *
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  474   * Return HW version or error
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  475   */
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  476  static u32 csid_hw_version(struct csid_device *csid)
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  477  {
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  478  	u32 hw_version;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  479  	u32 hw_gen;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  480  	u32 hw_rev;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  481  	u32 hw_step;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  482  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  483  	hw_version =3D readl_relaxed(csid->base + CSID_HW_V=
ERSION);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @484  	hw_gen =3D (hw_version >> HW_VERSION_GENERATION) & =
0xF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @485  	hw_rev =3D (hw_version >> HW_VERSION_REVISION) & 0x=
FFF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16 @486  	hw_step =3D (hw_version >> HW_VERSION_STEPPING) & 0=
xFFFF;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  487  	dev_dbg(csid->camss->dev, "CSID HW Version =3D %u.%=
u.%u\n",
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  488  		hw_gen, hw_rev, hw_step);
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  489  =

eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  490  	return hw_version;
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  491  }
eebe6d00e9bf12 drivers/media/platform/qcom/camss/camss-csid-170.c Robert Fo=
ss    2021-03-16  492  =


:::::: The code at line 407 was first introduced by commit
:::::: eebe6d00e9bf1216fb381b64146e1b7e50d90b3f media: camss: Add support f=
or CSID hardware version Titan 170

:::::: TO: Robert Foss <robert.foss@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2254561110890094125==--

