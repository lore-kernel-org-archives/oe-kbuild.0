Content-Type: multipart/mixed; boundary="===============6721691832671347714=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/spi/spidev.c:577:13: warning: Uninitialized variable: iter->devt [uninitvar]
Date: Wed, 13 Jul 2022 15:04:50 +0800
Message-ID: <202207131518.oElZIPR6-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6721691832671347714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/s=
pi/spidev.c:577:13: warning: Uninitialized variable: iter->devt [uninitvar]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jakob Koschel <jakobkoschel@gmail.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b047602d579b4fb028128a525f056bbdc890e7f0
commit: d50d7e91c6e5ccd71f21ba1aec3fef7ee4229fd6 spi: spidev: replace usage=
 of found with dedicated list iterator variable
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout d50d7e91c6e5ccd71f21ba1aec3fef7ee4229fd6
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)
>> drivers/usb/misc/ftdi-elan.c:994:8: warning: Local variable 'c' shadows =
outer variable [shadowVariable]
      u8 *c =3D 4 + ftdi->response;
          ^
   drivers/usb/misc/ftdi-elan.c:976:6: note: Shadowed declaration
     u8 c =3D ftdi->bulk_in_buffer[++ftdi->bulk_in_last];
        ^
   drivers/usb/misc/ftdi-elan.c:994:8: note: Shadow variable
      u8 *c =3D 4 + ftdi->response;
          ^

cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/usb/mon/mon_bin.c:432:4: warning: Assignment of function paramet=
er has no effect outside the function. [uselessAssignmentArg]
      offset =3D mon_copy_to_buff(rp, offset, sg_virt(sg),
      ^
   drivers/usb/mon/mon_bin.c:848:3: warning: Assignment of function paramet=
er has no effect outside the function. [uselessAssignmentArg]
     nbytes -=3D step_len;
     ^
>> drivers/usb/mon/mon_bin.c:849:3: warning: Assignment of function paramet=
er has no effect outside the function. Did you forget dereferencing it? [us=
elessAssignmentPtrArg]
     buf +=3D step_len;
     ^
>> drivers/spi/spidev.c:577:13: warning: Uninitialized variable: iter->devt=
 [uninitvar]
     if (iter->devt =3D=3D inode->i_rdev) {
               ^
--
>> drivers/staging/pi433/pi433_if.c:1066:9: warning: Redundant initializati=
on for 'retval'. The initialized value is overwritten before it is read. [r=
edundantInitialization]
    retval =3D idr_alloc(&pi433_idr, device, 0, N_PI433_MINORS, GFP_KERNEL);
           ^
   drivers/staging/pi433/pi433_if.c:1063:13: note: retval is initialized
    int retval =3D -ENOMEM;
               ^
   drivers/staging/pi433/pi433_if.c:1066:9: note: retval is overwritten
    retval =3D idr_alloc(&pi433_idr, device, 0, N_PI433_MINORS, GFP_KERNEL);
           ^
>> kernel/relay.c:360:2: warning: %d in format string (no. 2) requires 'int=
' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
    snprintf(tmpname, NAME_MAX, "%s%d", chan->base_filename, cpu);
    ^
>> drivers/vfio/vfio.c:316:49: warning: Parameter 'iommu_group' can be decl=
ared with const [constParameter]
   __vfio_group_get_from_iommu(struct iommu_group *iommu_group)
                                                   ^
>> drivers/vfio/vfio.c:508:23: warning: Parameter 'dev' can be declared wit=
h const [constParameter]
          struct device *dev)
                         ^
   drivers/vfio/vfio.c:1995:56: warning: Parameter 'test_group' can be decl=
ared with const [constParameter]
   bool vfio_external_group_match_file(struct vfio_group *test_group,
                                                          ^
>> drivers/vfio/vfio.c:252:12: warning: Uninitialized variable: tmp->ops [u=
ninitvar]
     if (tmp->ops =3D=3D ops) {
              ^
   drivers/vfio/vfio.c:243:6: note: Assuming condition is false
    if (!driver)
        ^
   drivers/vfio/vfio.c:252:12: note: Uninitialized variable: tmp->ops
     if (tmp->ops =3D=3D ops) {
              ^
>> drivers/vfio/vfio.c:273:15: warning: Uninitialized variable: driver->ops=
 [uninitvar]
     if (driver->ops =3D=3D ops) {
                 ^
>> drivers/vfio/vfio.c:321:14: warning: Uninitialized variable: group->iomm=
u_group [uninitvar]
     if (group->iommu_group =3D=3D iommu_group) {
                ^
   drivers/vfio/vfio.c:579:23: warning: Uninitialized variable: unbound->de=
v [uninitvar]
     if (dev =3D=3D unbound->dev) {
                         ^
>> drivers/vfio/vfio.c:1071:45: warning: Uninitialized variables: driver.op=
s, driver.vfio_next [uninitvar]
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
   drivers/vfio/vfio.c:1062:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1062:41: note: Assuming condition is false
    if (list_empty(&container->group_list) || container->iommu_driver) {
                                           ^
   drivers/vfio/vfio.c:1071:45: note: Uninitialized variables: driver.ops, =
driver.vfio_next
     if (!vfio_iommu_driver_allowed(container, driver))
                                               ^
--
>> fs/overlayfs/copy_up.c:417:57: warning: Possible null pointer dereferenc=
e: fh [nullPointer]
    err =3D ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
                                                           ^
   fs/overlayfs/copy_up.c:400:28: note: Assignment 'fh=3DNULL', assigned va=
lue is 0
    const struct ovl_fh *fh =3D NULL;
                              ^
   fs/overlayfs/copy_up.c:408:23: note: Assuming condition is false
    if (ovl_can_decode_fh(lower->d_sb)) {
                         ^
   fs/overlayfs/copy_up.c:417:57: note: Null pointer dereference
    err =3D ovl_check_setxattr(ofs, upper, OVL_XATTR_ORIGIN, fh->buf,
                                                           ^
>> fs/overlayfs/copy_up.c:107:10: warning: Local variable 'new' shadows out=
er argument [shadowArgument]
      void *new;
            ^
   fs/overlayfs/copy_up.c:48:21: note: Shadowed declaration
        struct dentry *new)
                       ^
   fs/overlayfs/copy_up.c:107:10: note: Shadow variable
      void *new;
            ^
--
>> fs/coredump.c:401:15: warning: Redundant initialization for 'core_waiter=
s'. The initialized value is overwritten before it is read. [redundantIniti=
alization]
    core_waiters =3D zap_threads(tsk, core_state, exit_code);
                 ^
   fs/coredump.c:395:19: note: core_waiters is initialized
    int core_waiters =3D -EBUSY;
                     ^
   fs/coredump.c:401:15: note: core_waiters is overwritten
    core_waiters =3D zap_threads(tsk, core_state, exit_code);
                 ^
>> kernel/bpf/bpf_iter.c:457:12: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (!ulen ^ !ubuf)
              ^
   kernel/bpf/bpf_iter.c:518:29: warning: Boolean result is used in bitwise=
 operation. Clarify expression with parentheses. [clarifyCondition]
    if (bpfptr_is_null(ulinfo) ^ !linfo_len)
                               ^
>> kernel/bpf/bpf_iter.c:312:26: warning: Uninitialized variable: tinfo->re=
g_info [uninitvar]
     if (reg_info =3D=3D tinfo->reg_info) {
                            ^
>> kernel/bpf/bpf_iter.c:344:14: warning: Uninitialized variable: tinfo->bt=
f_id [uninitvar]
     if (tinfo->btf_id && tinfo->btf_id =3D=3D prog_btf_id) {
                ^
   kernel/bpf/bpf_iter.c:339:13: note: Assuming condition is false
    if (strncmp(attach_fname, prefix, prefix_len))
               ^
   kernel/bpf/bpf_iter.c:344:14: note: Uninitialized variable: tinfo->btf_id
     if (tinfo->btf_id && tinfo->btf_id =3D=3D prog_btf_id) {
                ^
   kernel/bpf/bpf_iter.c:372:14: warning: Uninitialized variable: tinfo->bt=
f_id [uninitvar]
     if (tinfo->btf_id =3D=3D prog->aux->attach_btf_id) {
                ^
>> kernel/bpf/bpf_iter.c:376:8: warning: Uninitialized variable: reg_info [=
uninitvar]
      if (reg_info->get_func_proto)
          ^
   kernel/bpf/bpf_iter.c:375:20: note: Assignment 'reg_info=3Dtinfo->reg_in=
fo', assigned value is <Uninit>
      reg_info =3D tinfo->reg_info;
                      ^
   kernel/bpf/bpf_iter.c:376:8: note: Uninitialized variable: reg_info
      if (reg_info->get_func_proto)
          ^
>> drivers/tty/tty_io.c:545:61: warning: Parameter 'tty' can be declared wi=
th const [constParameter]
   static struct file *tty_release_redirect(struct tty_struct *tty)
                                                               ^
--
>> fs/pipe.c:1071:73: warning: Parameter 'cnt' can be declared with const [=
constParameter]
   static int wait_for_partner(struct pipe_inode_info *pipe, unsigned int *=
cnt)
                                                                           ^
--
>> drivers/usb/misc/ftdi-elan.c:2206:6: warning: Local variable 'roothub_a'=
 shadows outer function [shadowFunction]
    u32 roothub_a;
        ^
   drivers/usb/host/ohci.h:718:19: note: Shadowed declaration
   static inline u32 roothub_a (struct ohci_hcd *hc)
                     ^
   drivers/usb/misc/ftdi-elan.c:2206:6: note: Shadow variable
    u32 roothub_a;
        ^
>> drivers/usb/host/ohci.h:697:56: warning: Shifting signed 32-bit value by=
 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    u32 fit =3D ohci_readl(ohci, &ohci->regs->fminterval) & FIT;
                                                          ^
   drivers/usb/host/ohci.h:699:2: warning: Shifting signed 32-bit value by =
31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    ohci_writel (ohci, (fit ^ FIT) | ohci->fminterval,
    ^
>> drivers/usb/misc/ftdi-elan.c:2207:13: warning: Shifting signed 32-bit va=
lue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    int mask =3D OHCI_INTR_INIT;
               ^
   drivers/usb/misc/ftdi-elan.c:2211:11: warning: Shifting signed 32-bit va=
lue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    retval =3D ftdi_write_pcimem(ftdi, intrdisable, OHCI_INTR_MIE);
             ^
   drivers/usb/misc/ftdi-elan.c:2308:11: warning: Shifting signed 32-bit va=
lue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    retval =3D ftdi_write_pcimem(ftdi, fminterval,
             ^
   drivers/usb/misc/ftdi-elan.c:2350:11: warning: Shifting signed 32-bit va=
lue by 31 bits is implementation-defined behaviour [shiftTooManyBitsSigned]
    retval =3D ftdi_write_pcimem(ftdi, intrdisable,
             ^
>> drivers/usb/host/ohci.h:697:56: warning: Signed integer overflow for exp=
ression '1<<31'. [integerOverflow]
    u32 fit =3D ohci_readl(ohci, &ohci->regs->fminterval) & FIT;
                                                          ^
   drivers/usb/host/ohci.h:699:2: warning: Signed integer overflow for expr=
ession '1<<31'. [integerOverflow]
    ohci_writel (ohci, (fit ^ FIT) | ohci->fminterval,
    ^
>> drivers/usb/misc/ftdi-elan.c:2207:13: warning: Signed integer overflow f=
or expression '1<<31'. [integerOverflow]
    int mask =3D OHCI_INTR_INIT;
               ^
   drivers/usb/misc/ftdi-elan.c:2211:11: warning: Signed integer overflow f=
or expression '1<<31'. [integerOverflow]
    retval =3D ftdi_write_pcimem(ftdi, intrdisable, OHCI_INTR_MIE);
             ^
   drivers/usb/misc/ftdi-elan.c:2308:11: warning: Signed integer overflow f=
or expression '1<<31'. [integerOverflow]
    retval =3D ftdi_write_pcimem(ftdi, fminterval,
             ^
   drivers/usb/misc/ftdi-elan.c:2350:11: warning: Signed integer overflow f=
or expression '1<<31'. [integerOverflow]
    retval =3D ftdi_write_pcimem(ftdi, intrdisable,
             ^
   drivers/usb/misc/ftdi-elan.c:2362:18: warning: Signed integer overflow f=
or expression '0xff<<24'. [integerOverflow]
     roothub_a &=3D ~(RH_A_POTPGT | RH_A_NPS);
                    ^
>> drivers/usb/misc/ftdi-elan.c:2781:27: warning: Uninitialized variables: =
ftdi.ftdi_list, ftdi.u132_lock, ftdi.command_next, ftdi.command_head, ftdi.=
respond_next, ftdi.respond_head, ftdi.synchronized, ftdi.enumerated, ftdi.r=
egistered, ftdi.initialized, ftdi.card_ejected, ftdi.function, ftdi.sequenc=
e_num, ftdi.disconnected, ftdi.gone_away, ftdi.stuck_status, ftdi.status_qu=
eue_delay, ftdi.sw_lock, ftdi.udev, ftdi.interface, ftdi.class, ftdi.status=
_work, ftdi.command_work, ftdi.respond_work, ftdi.platform_data, ftdi.platf=
orm_dev, ftdi.bulk_in_buffer, ftdi.bulk_in_size, ftdi.bulk_in_last, ftdi.bu=
lk_in_left, ftdi.bulk_in_endpointAddr, ftdi.bulk_out_endpointAddr, ftdi.kre=
f, ftdi.controlreg, ftdi.expected, ftdi.received, ftdi.ed_found [uninitvar]
     ftdi_status_cancel_work(ftdi);
                             ^

vim +577 drivers/spi/spidev.c

7d48ec3698e7b7 Bernhard Walle    2011-02-03  568  =

814a8d50eb1d88 Andrea Paterniani 2007-05-08  569  static int spidev_open(st=
ruct inode *inode, struct file *filp)
814a8d50eb1d88 Andrea Paterniani 2007-05-08  570  {
d50d7e91c6e5cc Jakob Koschel     2022-03-24  571  	struct spidev_data	*spid=
ev =3D NULL, *iter;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  572  	int			status =3D -ENXIO;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  573  =

814a8d50eb1d88 Andrea Paterniani 2007-05-08  574  	mutex_lock(&device_list_=
lock);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  575  =

d50d7e91c6e5cc Jakob Koschel     2022-03-24  576  	list_for_each_entry(iter=
, &device_list, device_entry) {
d50d7e91c6e5cc Jakob Koschel     2022-03-24 @577  		if (iter->devt =3D=3D i=
node->i_rdev) {
814a8d50eb1d88 Andrea Paterniani 2007-05-08  578  			status =3D 0;
d50d7e91c6e5cc Jakob Koschel     2022-03-24  579  			spidev =3D iter;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  580  			break;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  581  		}
814a8d50eb1d88 Andrea Paterniani 2007-05-08  582  	}
865f6d1974ddd9 Ray Jui           2014-10-09  583  =

d50d7e91c6e5cc Jakob Koschel     2022-03-24  584  	if (!spidev) {
865f6d1974ddd9 Ray Jui           2014-10-09  585  		pr_debug("spidev: nothi=
ng for minor %d\n", iminor(inode));
865f6d1974ddd9 Ray Jui           2014-10-09  586  		goto err_find_dev;
865f6d1974ddd9 Ray Jui           2014-10-09  587  	}
865f6d1974ddd9 Ray Jui           2014-10-09  588  =

865f6d1974ddd9 Ray Jui           2014-10-09  589  	if (!spidev->tx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  590  		spidev->tx_buffer =3D k=
malloc(bufsiz, GFP_KERNEL);
865f6d1974ddd9 Ray Jui           2014-10-09  591  		if (!spidev->tx_buffer)=
 {
814a8d50eb1d88 Andrea Paterniani 2007-05-08  592  			dev_dbg(&spidev->spi->=
dev, "open/ENOMEM\n");
814a8d50eb1d88 Andrea Paterniani 2007-05-08  593  			status =3D -ENOMEM;
865f6d1974ddd9 Ray Jui           2014-10-09  594  			goto err_find_dev;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  595  		}
814a8d50eb1d88 Andrea Paterniani 2007-05-08  596  	}
865f6d1974ddd9 Ray Jui           2014-10-09  597  =

865f6d1974ddd9 Ray Jui           2014-10-09  598  	if (!spidev->rx_buffer) {
865f6d1974ddd9 Ray Jui           2014-10-09  599  		spidev->rx_buffer =3D k=
malloc(bufsiz, GFP_KERNEL);
865f6d1974ddd9 Ray Jui           2014-10-09  600  		if (!spidev->rx_buffer)=
 {
865f6d1974ddd9 Ray Jui           2014-10-09  601  			dev_dbg(&spidev->spi->=
dev, "open/ENOMEM\n");
865f6d1974ddd9 Ray Jui           2014-10-09  602  			status =3D -ENOMEM;
865f6d1974ddd9 Ray Jui           2014-10-09  603  			goto err_alloc_rx_buf;
865f6d1974ddd9 Ray Jui           2014-10-09  604  		}
865f6d1974ddd9 Ray Jui           2014-10-09  605  	}
865f6d1974ddd9 Ray Jui           2014-10-09  606  =

814a8d50eb1d88 Andrea Paterniani 2007-05-08  607  	spidev->users++;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  608  	filp->private_data =3D s=
pidev;
c5bf68fe0c86a5 Kirill Smelkov    2019-03-26  609  	stream_open(inode, filp);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  610  =

865f6d1974ddd9 Ray Jui           2014-10-09  611  	mutex_unlock(&device_lis=
t_lock);
865f6d1974ddd9 Ray Jui           2014-10-09  612  	return 0;
865f6d1974ddd9 Ray Jui           2014-10-09  613  =

865f6d1974ddd9 Ray Jui           2014-10-09  614  err_alloc_rx_buf:
865f6d1974ddd9 Ray Jui           2014-10-09  615  	kfree(spidev->tx_buffer);
865f6d1974ddd9 Ray Jui           2014-10-09  616  	spidev->tx_buffer =3D NU=
LL;
865f6d1974ddd9 Ray Jui           2014-10-09  617  err_find_dev:
814a8d50eb1d88 Andrea Paterniani 2007-05-08  618  	mutex_unlock(&device_lis=
t_lock);
814a8d50eb1d88 Andrea Paterniani 2007-05-08  619  	return status;
814a8d50eb1d88 Andrea Paterniani 2007-05-08  620  }
814a8d50eb1d88 Andrea Paterniani 2007-05-08  621  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6721691832671347714==--

