Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFA341C6A
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 02:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775183434; cv=none; b=mp4LkbUI+I0ZhdkRjpOhRezyJQc8gvFs8TThs3cAig6BnL/tIzySEXTqeGnmubxpbf1OOhiJUf4JxA1zSdO86eurYne87bHYU20hEnH63+iO1g26xz9MGc/Uc5eFWmA/F9BJk7tjiFWIbC9GWxWZhyAQAfDVkVjWv9XQDmHutis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775183434; c=relaxed/simple;
	bh=Etvy2gKLvXFgWd8hR1QSrCh0F4FWlgqnPoZMVSfW/VQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TXa5eJcY5VY7IThu9ii6nipY9pMcL2HUSZzb/NUSF93wAK1kSaydkeFVSWhv+q+8jzW78GJe+fWsfkTsC4y0ICYRAR9Ib3C2lTz1DXuZPhhvz7ZpsA/9vR+Wx/hwkZnztINic9Er9oChwJLzXEkxc0eA3rFq2eHgZZrTsFjBmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LslyLDc2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LslyLDc2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775183431; x=1806719431;
  h=date:from:to:cc:subject:message-id;
  bh=Etvy2gKLvXFgWd8hR1QSrCh0F4FWlgqnPoZMVSfW/VQ=;
  b=LslyLDc2rmpqtmqbqXOsdhiXwDlJlHmKl1Rc+rKmjWrsNCUMBP2J1N1O
   jVWnhDbzjlnkw0EcWj6AZ88aSfd1W2IEEfNqaJPuR4A7kq7JizH8L4mjE
   YzIdpFdkJyim0bN6HFvz0suGDHOu7HtrPH5NQKgvayib5UHxtuApOuqwj
   +OxFuVljygxXnMUGy913sJhrpQOehYq/tRr5XouNGVCYiJCgIRBurO3CO
   Z0OXuQtK7imP/OJ/ZDM564igieNknVBG/vsJ6djWD/bFa38ZmSrYr6SRv
   VCGC3fRzukzV6E9RM4vAok396sPAq5aq25Q3JXbMUZS8WaMrVEibJ/JVI
   A==;
X-CSE-ConnectionGUID: XBARdGtzRIu/mrzdkSNALw==
X-CSE-MsgGUID: QxB64C+STxef0lmkmS7jmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80139526"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="80139526"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 19:30:30 -0700
X-CSE-ConnectionGUID: jCJoK7pYRQW7gcBW11ZKvA==
X-CSE-MsgGUID: 8R4kxy4LQ9iRyWopZrYZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; 
   d="scan'208";a="220505947"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Apr 2026 19:30:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8UIl-000000009Dh-0RbM;
	Fri, 03 Apr 2026 02:30:27 +0000
Date: Fri, 03 Apr 2026 04:29:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ./include/linux/syscalls.h:1272:12: error: storage class
 specified for parameter 'do_fchownat'
Message-ID: <202604030405.upvs6TwM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jori Koolstra <jkoolstra@xs4all.nl>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jori-Koolstra/vfs-syscalls-add-mkdirat_fd/20260403-081814
head:   85e6769a533bc630bbd4c845e65b9c5a6a417255
commit: bfe7d05f0badc6b80147a4856394d1824a853f27 vfs: syscalls: add mkdirat_fd()
date:   2 hours ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260403/202604030405.upvs6TwM-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030405.upvs6TwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604030405.upvs6TwM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from ./include/linux/entry-virt.h:7,
                    from ./include/linux/kvm_host.h:5,
                    from ./arch/powerpc/include/asm/kvm_ppc.h:19,
                    from ./arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:37:
   ./include/linux/syscalls.h:1002:17: warning: no previous prototype for 'sys_mkdirat_fd' [-Wmissing-prototypes]
    1002 | asmlinkage long sys_mkdirat_fd(int dfd, const char __user *pathname, umode_t mode,
         |                 ^~~~~~~~~~~~~~
   ./include/linux/syscalls.h: In function 'sys_mkdirat_fd':
>> ./include/linux/syscalls.h:1272:12: error: storage class specified for parameter 'do_fchownat'
    1272 | extern int do_fchownat(int dfd, const char __user *filename, uid_t user,
         |            ^~~~~~~~~~~
>> ./include/linux/syscalls.h:1277:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1277 | {
         | ^
   ./include/linux/syscalls.h:1283:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1283 | {
         | ^
   ./include/linux/syscalls.h:1293:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
    1293 | {
         | ^
   In file included from ./include/uapi/linux/mei.h:10,
                    from ./include/linux/mod_devicetable.h:12,
                    from ./include/linux/of.h:19,
                    from ./include/linux/clocksource.h:19,
                    from ./include/linux/clockchips.h:14,
                    from ./include/linux/tick.h:8,
                    from ./include/linux/entry-virt.h:10:
>> ./include/uapi/linux/mei_uuid.h:16:3: error: storage class specified for parameter 'uuid_le'
      16 | } uuid_le;
         |   ^~~~~~~
>> ./include/uapi/linux/mei.h:34:1: warning: empty declaration
      34 | struct mei_client {
         | ^~~~~~
>> ./include/uapi/linux/mei.h:45:17: error: expected specifier-qualifier-list before 'uuid_le'
      45 |                 uuid_le in_client_uuid;
         |                 ^~~~~~~
   ./include/uapi/linux/mei.h:43:1: warning: empty declaration
      43 | struct mei_connect_client_data {
         | ^~~~~~
   ./include/uapi/linux/mei.h:77:9: error: expected specifier-qualifier-list before 'uuid_le'
      77 |         uuid_le in_client_uuid;
         |         ^~~~~~~
   ./include/uapi/linux/mei.h:76:1: warning: empty declaration
      76 | struct mei_connect_client_vtag {
         | ^~~~~~
   ./include/uapi/linux/mei.h:88:1: warning: empty declaration
      88 | struct mei_connect_client_data_vtag {
         | ^~~~~~
>> ./include/linux/mod_devicetable.h:15:23: error: storage class specified for parameter 'kernel_ulong_t'
      15 | typedef unsigned long kernel_ulong_t;
         |                       ^~~~~~~~~~~~~~
>> ./include/linux/mod_devicetable.h:20:1: warning: empty declaration
      20 | enum {
         | ^~~~
>> ./include/linux/mod_devicetable.h:48:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
      48 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:44:1: warning: empty declaration
      44 | struct pci_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:64:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
      64 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:58:1: warning: empty declaration
      58 | struct ieee1394_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:152:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     152 |         kernel_ulong_t  driver_info
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:128:1: warning: empty declaration
     128 | struct usb_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:178:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     178 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:173:1: warning: empty declaration
     173 | struct hid_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:190:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     190 |         kernel_ulong_t driver_info;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:182:1: warning: empty declaration
     182 | struct ccw_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:202:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     202 |         kernel_ulong_t driver_info;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:199:1: warning: empty declaration
     199 | struct ap_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:212:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     212 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:209:1: warning: empty declaration
     209 | struct css_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:219:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     219 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:217:1: warning: empty declaration
     217 | struct acpi_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:242:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     242 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:240:1: warning: empty declaration
     240 | struct pnp_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:247:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     247 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:245:1: warning: empty declaration
     245 | struct pnp_card_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:256:1: warning: empty declaration
     256 | struct serio_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:263:1: warning: empty declaration
     263 | struct hda_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:276:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     276 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:271:1: warning: empty declaration
     271 | struct sdw_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:282:1: warning: empty declaration
     282 | struct of_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:290:1: warning: empty declaration
     290 | struct vio_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:317:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     317 |         kernel_ulong_t  driver_info;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:297:1: warning: empty declaration
     297 | struct pcmcia_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:364:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     364 |         kernel_ulong_t flags;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:362:1: warning: empty declaration
     362 | struct input_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:392:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     392 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:390:1: warning: empty declaration
     390 | struct eisa_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:397:1: warning: empty declaration
     397 | struct parisc_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:417:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     417 |         kernel_ulong_t driver_data;     /* Data private to the driver */
--
         | ^~~~~~
   ./include/linux/mod_devicetable.h:460:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     460 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:458:1: warning: empty declaration
     458 | struct hv_vmbus_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:470:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     470 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:468:1: warning: empty declaration
     468 | struct rpmsg_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:480:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     480 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:478:1: warning: empty declaration
     478 | struct i2c_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:490:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     490 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:488:1: warning: empty declaration
     488 | struct pci_epf_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:500:1: warning: empty declaration
     500 | struct i3c_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:517:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     517 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:515:1: warning: empty declaration
     515 | struct spi_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:530:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     530 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:525:1: warning: empty declaration
     525 | struct slim_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:541:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     541 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:536:1: warning: empty declaration
     536 | struct apr_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:549:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     549 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:547:1: warning: empty declaration
     547 | struct spmi_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:553:1: warning: empty declaration
     553 | enum dmi_field {
         | ^~~~
   ./include/linux/mod_devicetable.h:581:1: warning: empty declaration
     581 | struct dmi_strmatch {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:587:1: warning: empty declaration
     587 | struct dmi_system_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:609:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     609 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:607:1: warning: empty declaration
     607 | struct platform_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:633:1: warning: empty declaration
     633 | struct mdio_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:640:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     640 |         kernel_ulong_t driver_data;     /* Data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:638:1: warning: empty declaration
     638 | struct zorro_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:651:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     651 |         kernel_ulong_t driver_data;     /* data private to the driver */
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:648:1: warning: empty declaration
     648 | struct isapnp_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:662:1: warning: empty declaration
     662 | struct amba_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:672:1: warning: empty declaration
     672 | struct mips_cdmm_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:695:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     695 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:686:1: warning: empty declaration
     686 | struct x86_cpu_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:713:1: warning: empty declaration
     713 | struct cpu_feature {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:719:1: warning: empty declaration
     719 | struct ipack_device_id {
         | ^~~~~~
>> ./include/linux/mod_devicetable.h:740:9: error: expected specifier-qualifier-list before 'uuid_le'
     740 |         uuid_le uuid;
         |         ^~~~~~~
   ./include/linux/mod_devicetable.h:738:1: warning: empty declaration
     738 | struct mei_cl_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:759:1: warning: empty declaration
     759 | struct rio_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:766:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     766 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:764:1: warning: empty declaration
     764 | struct mcb_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:772:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     772 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:769:1: warning: empty declaration
     769 | struct ulpi_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:783:1: warning: empty declaration
     783 | struct fsl_mc_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:807:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     807 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:801:1: warning: empty declaration
     801 | struct tb_service_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:828:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     828 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:825:1: warning: empty declaration
     825 | struct typec_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:836:1: warning: empty declaration
     836 | struct tee_client_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:849:1: warning: empty declaration
     849 | struct wmi_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:866:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     866 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:864:1: warning: empty declaration
     864 | struct mhi_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:874:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     874 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:872:1: warning: empty declaration
     872 | struct auxiliary_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:892:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     892 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:883:1: warning: empty declaration
     883 | struct ssam_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:916:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     916 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:913:1: warning: empty declaration
     913 | struct dfl_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:930:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     930 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:928:1: warning: empty declaration
     928 | struct ishtp_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:935:1: warning: empty declaration
     935 | enum {
         | ^~~~
   ./include/linux/mod_devicetable.h:954:1: warning: empty declaration
     954 | struct cdx_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:964:1: warning: empty declaration
     964 | struct vchiq_device_id {
         | ^~~~~~
   ./include/linux/mod_devicetable.h:975:9: error: expected specifier-qualifier-list before 'kernel_ulong_t'
     975 |         kernel_ulong_t driver_data;
         |         ^~~~~~~~~~~~~~
   ./include/linux/mod_devicetable.h:973:1: warning: empty declaration
     973 | struct coreboot_device_id {
         | ^~~~~~
   In file included from ./include/linux/of.h:20:
>> ./include/linux/property.h:22:1: warning: empty declaration
      22 | struct device;
         | ^~~~~~
   ./include/linux/property.h:24:1: warning: empty declaration
      24 | enum dev_prop_type {
         | ^~~~
>> ./include/linux/property.h:84:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      84 | {
         | ^
   ./include/linux/property.h:95:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      95 | {
         | ^
   ./include/linux/property.h:111:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     111 | {
         | ^
   ./include/linux/property.h:123:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     123 | {
         | ^
   ./include/linux/property.h:135:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     135 | {
         | ^
   ./include/linux/property.h:225:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     225 | {
         | ^
   In file included from ./include/linux/preempt.h:11,
                    from ./include/linux/alloc_tag.h:11,
                    from ./include/linux/rhashtable-types.h:12,
                    from ./include/linux/ipc.h:7,
                    from ./include/uapi/linux/sem.h:5,
                    from ./include/linux/sem.h:5,
                    from ./include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:13:
>> ./include/linux/cleanup.h:211:61: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                             ^
   ./include/linux/property.h:229:1: note: in expansion of macro 'DEFINE_FREE'
     229 | DEFINE_FREE(fwnode_handle, struct fwnode_handle *, fwnode_handle_put(_T))
         | ^~~~~~~~~~~
   ./include/linux/property.h:237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     237 | {
         | ^
   ./include/linux/property.h:245:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     245 | {
         | ^
   ./include/linux/property.h:251:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     251 | {
         | ^
   ./include/linux/property.h:257:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     257 | {
         | ^
   ./include/linux/property.h:263:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     263 | {
         | ^
   ./include/linux/property.h:269:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     269 | {
         | ^
   ./include/linux/property.h:274:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     274 | {
         | ^
   ./include/linux/property.h:279:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     279 | {
         | ^
   ./include/linux/property.h:284:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     284 | {
         | ^
   ./include/linux/property.h:289:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     289 | {
         | ^
   ./include/linux/property.h:295:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     295 | {
         | ^
   ./include/linux/property.h:301:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     301 | {
         | ^
   ./include/linux/property.h:307:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     307 | {
         | ^
   ./include/linux/property.h:313:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     313 | {
         | ^
   ./include/linux/property.h:319:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     319 | {
         | ^
   ./include/linux/property.h:325:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     325 | {
         | ^
   ./include/linux/property.h:331:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     331 | {
         | ^
   ./include/linux/property.h:337:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     337 | {
         | ^
   ./include/linux/property.h:343:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     343 | {
         | ^
   ./include/linux/property.h:350:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     350 | {
         | ^
   ./include/linux/property.h:354:1: warning: empty declaration
     354 | struct software_node;
         | ^~~~~~
   ./include/linux/property.h:363:1: warning: empty declaration
     363 | struct software_node_ref_args {
         | ^~~~~~
   ./include/linux/property.h:392:1: warning: empty declaration
     392 | struct property_entry {
         | ^~~~~~
   ./include/linux/property.h:514:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     514 | {
         | ^
>> ./include/linux/property.h:545:17: error: storage class specified for parameter 'devcon_match_fn_t'
     545 | typedef void *(*devcon_match_fn_t)(const struct fwnode_handle *fwnode, const char *id,
         |                 ^~~~~~~~~~~~~~~~~
>> ./include/linux/property.h:550:36: error: expected declaration specifiers or '...' before 'devcon_match_fn_t'
     550 |                                    devcon_match_fn_t match);
         |                                    ^~~~~~~~~~~~~~~~~
   ./include/linux/property.h:554:50: error: expected declaration specifiers or '...' before 'devcon_match_fn_t'
     554 |                                                  devcon_match_fn_t match)
         |                                                  ^~~~~~~~~~~~~~~~~
   ./include/linux/property.h:561:36: error: expected declaration specifiers or '...' before 'devcon_match_fn_t'
     561 |                                    devcon_match_fn_t match,
         |                                    ^~~~~~~~~~~~~~~~~
   ./include/linux/property.h:573:1: warning: empty declaration
     573 | struct software_node {
         | ^~~~~~
>> ./include/linux/of.h:25:13: error: storage class specified for parameter 'phandle'
      25 | typedef u32 phandle;
         |             ^~~~~~~
>> ./include/linux/of.h:26:13: error: storage class specified for parameter 'ihandle'
      26 | typedef u32 ihandle;
         |             ^~~~~~~
>> ./include/linux/of.h:28:1: warning: empty declaration
      28 | struct property {
         | ^~~~~~
>> ./include/linux/of.h:50:9: error: expected specifier-qualifier-list before 'phandle'
      50 |         phandle phandle;
         |         ^~~~~~~
   ./include/linux/of.h:48:1: warning: empty declaration
      48 | struct device_node {
         | ^~~~~~
   ./include/linux/of.h:71:1: warning: empty declaration
      71 | struct of_phandle_args {
         | ^~~~~~
   ./include/linux/of.h:90:9: error: expected specifier-qualifier-list before 'phandle'
      90 |         phandle phandle;
         |         ^~~~~~~
   ./include/linux/of.h:77:1: warning: empty declaration
      77 | struct of_phandle_iterator {
         | ^~~~~~
   ./include/linux/of.h:94:1: warning: empty declaration
      94 | struct of_reconfig_data {
         | ^~~~~~
>> ./include/linux/of.h:100:31: error: storage class specified for parameter 'of_node_ktype'
     100 | extern const struct kobj_type of_node_ktype;
         |                               ^~~~~~~~~~~~~
>> ./include/linux/of.h:101:39: error: storage class specified for parameter 'of_fwnode_ops'
     101 | extern const struct fwnode_operations of_fwnode_ops;
         |                                       ^~~~~~~~~~~~~
   ./include/linux/of.h:114:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     114 | {
         | ^
   ./include/linux/of.h:128:28: error: storage class specified for parameter 'of_node_get'
     128 | extern struct device_node *of_node_get(struct device_node *node);
         |                            ^~~~~~~~~~~
   ./include/linux/of.h:129:13: error: storage class specified for parameter 'of_node_put'
     129 | extern void of_node_put(struct device_node *node);
         |             ^~~~~~~~~~~
   ./include/linux/cleanup.h:211:61: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     211 |         static __always_inline void __free_##_name(void *p) { _type _T = *(_type *)p; _free; }
         |                                                             ^
   ./include/linux/of.h:138:1: note: in expansion of macro 'DEFINE_FREE'
     138 | DEFINE_FREE(device_node, struct device_node *, if (_T) of_node_put(_T))
         | ^~~~~~~~~~~
   ./include/linux/of.h:141:28: error: storage class specified for parameter 'of_root'
     141 | extern struct device_node *of_root;
         |                            ^~~~~~~
   ./include/linux/of.h:142:28: error: storage class specified for parameter 'of_chosen'
     142 | extern struct device_node *of_chosen;
         |                            ^~~~~~~~~
   ./include/linux/of.h:143:28: error: storage class specified for parameter 'of_aliases'
     143 | extern struct device_node *of_aliases;
         |                            ^~~~~~~~~~
   ./include/linux/of.h:144:28: error: storage class specified for parameter 'of_stdout'
     144 | extern struct device_node *of_stdout;
         |                            ^~~~~~~~~
   ./include/linux/of.h:163:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     163 | {
         | ^
   ./include/linux/of.h:186:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     186 | {
         | ^
   ./include/linux/of.h:191:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     191 | {
         | ^
   ./include/linux/of.h:197:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     197 | {
         | ^
   ./include/linux/of.h:202:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     202 | {
         | ^
   ./include/linux/of.h:207:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     207 | {
         | ^
   ./include/linux/of.h:213:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     213 | {
         | ^
   ./include/linux/of.h:218:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     218 | {
         | ^
   ./include/linux/of.h:223:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     223 | {
         | ^
   ./include/linux/of.h:228:28: error: storage class specified for parameter '__of_find_all_nodes'
     228 | extern struct device_node *__of_find_all_nodes(struct device_node *prev);
         |                            ^~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:229:28: error: storage class specified for parameter 'of_find_all_nodes'
     229 | extern struct device_node *of_find_all_nodes(struct device_node *prev);
         |                            ^~~~~~~~~~~~~~~~~
   ./include/linux/of.h:237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     237 | {
         | ^
   ./include/linux/of.h:246:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | {
         | ^
   ./include/linux/of.h:258:13: error: storage class specified for parameter 'of_node_name_eq'
     258 | extern bool of_node_name_eq(const struct device_node *np, const char *name);
         |             ^~~~~~~~~~~~~~~
   ./include/linux/of.h:259:13: error: storage class specified for parameter 'of_node_name_prefix'
     259 | extern bool of_node_name_prefix(const struct device_node *np, const char *prefix);
         |             ^~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:262:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     262 | {
         | ^
   ./include/linux/of.h:269:28: error: storage class specified for parameter 'of_find_node_by_name'
     269 | extern struct device_node *of_find_node_by_name(struct device_node *from,
         |                            ^~~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:271:28: error: storage class specified for parameter 'of_find_node_by_type'
     271 | extern struct device_node *of_find_node_by_type(struct device_node *from,
         |                            ^~~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:273:28: error: storage class specified for parameter 'of_find_compatible_node'
     273 | extern struct device_node *of_find_compatible_node(struct device_node *from,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:275:28: error: storage class specified for parameter 'of_find_matching_node_and_match'
     275 | extern struct device_node *of_find_matching_node_and_match(
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:280:28: error: storage class specified for parameter 'of_find_node_opts_by_path'
     280 | extern struct device_node *of_find_node_opts_by_path(const char *path,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/of.h:283:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     283 | {
         | ^
   ./include/linux/of.h:287:52: error: expected declaration specifiers or '...' before 'phandle'
     287 | extern struct device_node *of_find_node_by_phandle(phandle handle);
         |                                                    ^~~~~~~
   ./include/linux/of.h:288:28: error: storage class specified for parameter 'of_get_parent'
     288 | extern struct device_node *of_get_parent(const struct device_node *node);


vim +/do_fchownat +1272 ./include/linux/syscalls.h

3c1c456f9b96c2 Dominik Brodowski 2018-03-25  1231  
819671ff849b07 Dominik Brodowski 2018-03-11  1232  /*
819671ff849b07 Dominik Brodowski 2018-03-11  1233   * Kernel code should not call syscalls (i.e., sys_xyzyyz()) directly.
819671ff849b07 Dominik Brodowski 2018-03-11  1234   * Instead, use one of the functions which work equivalently, such as
819671ff849b07 Dominik Brodowski 2018-03-11  1235   * the ksys_xyzyyz() functions prototyped below.
819671ff849b07 Dominik Brodowski 2018-03-11  1236   */
e7a3e8b2edf544 Dominik Brodowski 2018-03-11  1237  ssize_t ksys_write(unsigned int fd, const char __user *buf, size_t count);
55731b3cda3a85 Dominik Brodowski 2018-03-11  1238  int ksys_fchown(unsigned int fd, uid_t user, gid_t group);
3ce4a7bf662637 Dominik Brodowski 2018-03-13  1239  ssize_t ksys_read(unsigned int fd, char __user *buf, size_t count);
70f68ee81e2e9a Dominik Brodowski 2018-03-14  1240  void ksys_sync(void);
9b32105ec6b13d Dominik Brodowski 2018-03-11  1241  int ksys_unshare(unsigned long unshare_flags);
e2aaa9f423367e Dominik Brodowski 2018-03-16  1242  int ksys_setsid(void);
806cbae1228cc1 Dominik Brodowski 2018-03-11  1243  int ksys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
806cbae1228cc1 Dominik Brodowski 2018-03-11  1244  			 unsigned int flags);
36028d5dd71175 Dominik Brodowski 2018-03-19  1245  ssize_t ksys_pread64(unsigned int fd, char __user *buf, size_t count,
36028d5dd71175 Dominik Brodowski 2018-03-19  1246  		     loff_t pos);
36028d5dd71175 Dominik Brodowski 2018-03-19  1247  ssize_t ksys_pwrite64(unsigned int fd, const char __user *buf,
36028d5dd71175 Dominik Brodowski 2018-03-19  1248  		      size_t count, loff_t pos);
edf292c76b884a Dominik Brodowski 2018-03-19  1249  int ksys_fallocate(int fd, int mode, loff_t offset, loff_t len);
9d5b7c956b09da Dominik Brodowski 2018-03-11  1250  #ifdef CONFIG_ADVISE_SYSCALLS
9d5b7c956b09da Dominik Brodowski 2018-03-11  1251  int ksys_fadvise64_64(int fd, loff_t offset, loff_t len, int advice);
9d5b7c956b09da Dominik Brodowski 2018-03-11  1252  #else
9d5b7c956b09da Dominik Brodowski 2018-03-11  1253  static inline int ksys_fadvise64_64(int fd, loff_t offset, loff_t len,
9d5b7c956b09da Dominik Brodowski 2018-03-11  1254  				    int advice)
9d5b7c956b09da Dominik Brodowski 2018-03-11  1255  {
9d5b7c956b09da Dominik Brodowski 2018-03-11  1256  	return -EINVAL;
9d5b7c956b09da Dominik Brodowski 2018-03-11  1257  }
9d5b7c956b09da Dominik Brodowski 2018-03-11  1258  #endif
a90f590a1bee36 Dominik Brodowski 2018-03-11  1259  unsigned long ksys_mmap_pgoff(unsigned long addr, unsigned long len,
a90f590a1bee36 Dominik Brodowski 2018-03-11  1260  			      unsigned long prot, unsigned long flags,
a90f590a1bee36 Dominik Brodowski 2018-03-11  1261  			      unsigned long fd, unsigned long pgoff);
c7b95d5156a9ee Dominik Brodowski 2018-03-19  1262  ssize_t ksys_readahead(int fd, loff_t offset, size_t count);
58fa4a410fc31a Arnd Bergmann     2019-01-16  1263  int ksys_ipc(unsigned int call, int first, unsigned long second,
58fa4a410fc31a Arnd Bergmann     2019-01-16  1264  	unsigned long third, void __user * ptr, long fifth);
58fa4a410fc31a Arnd Bergmann     2019-01-16  1265  int compat_ksys_ipc(u32 call, int first, int second,
58fa4a410fc31a Arnd Bergmann     2019-01-16  1266  	u32 third, u32 ptr, u32 fifth);
312db1aa1dc7bf Dominik Brodowski 2018-03-11  1267  
0f32ab8cfac478 Dominik Brodowski 2018-03-11  1268  /*
0f32ab8cfac478 Dominik Brodowski 2018-03-11  1269   * The following kernel syscall equivalents are just wrappers to fs-internal
0f32ab8cfac478 Dominik Brodowski 2018-03-11  1270   * functions. Therefore, provide stubs to be inlined at the callsites.
0f32ab8cfac478 Dominik Brodowski 2018-03-11  1271   */
55731b3cda3a85 Dominik Brodowski 2018-03-11 @1272  extern int do_fchownat(int dfd, const char __user *filename, uid_t user,
55731b3cda3a85 Dominik Brodowski 2018-03-11  1273  		       gid_t group, int flag);
55731b3cda3a85 Dominik Brodowski 2018-03-11  1274  
55731b3cda3a85 Dominik Brodowski 2018-03-11  1275  static inline long ksys_chown(const char __user *filename, uid_t user,
55731b3cda3a85 Dominik Brodowski 2018-03-11  1276  			      gid_t group)
55731b3cda3a85 Dominik Brodowski 2018-03-11 @1277  {
55731b3cda3a85 Dominik Brodowski 2018-03-11  1278  	return do_fchownat(AT_FDCWD, filename, user, group, 0);
55731b3cda3a85 Dominik Brodowski 2018-03-11  1279  }
55731b3cda3a85 Dominik Brodowski 2018-03-11  1280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
