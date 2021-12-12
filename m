Content-Type: multipart/mixed; boundary="===============7379053097725284054=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/firmware_if.c:586 hl_fw_cpucp_power_get() error: uninitialized symbol 'result'.
Date: Mon, 13 Dec 2021 01:13:50 +0800
Message-ID: <202112130156.faC9A7zp-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7379053097725284054==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sagiv Ozeri <sozeri@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a763d5a5abd65797aec3dd1bf01fe2ccbec32967
commit: 586f2caf0ef952ca5e0f38a00b7ba8d945345cf7 habanalabs: return current=
 power via INFO IOCTL
date:   8 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211213/202112130156.faC9A7zp-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/habanalabs/common/firmware_if.c:586 hl_fw_cpucp_power_get() er=
ror: uninitialized symbol 'result'.

Old smatch warnings:
drivers/misc/habanalabs/common/firmware_if.c:122 hl_fw_send_cpu_message() e=
rror: uninitialized symbol 'pkt_dma_addr'.
drivers/misc/habanalabs/common/firmware_if.c:243 hl_fw_test_cpu_queue() err=
or: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:286 hl_fw_send_heartbeat() err=
or: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:382 hl_fw_cpucp_info_get() err=
or: uninitialized symbol 'cpucp_info_dma_addr'.
drivers/misc/habanalabs/common/firmware_if.c:443 hl_fw_get_eeprom_data() er=
ror: uninitialized symbol 'eeprom_info_dma_addr'.
drivers/misc/habanalabs/common/firmware_if.c:457 hl_fw_get_eeprom_data() er=
ror: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:485 hl_fw_cpucp_pci_counters_g=
et() error: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:537 hl_fw_cpucp_total_energy_g=
et() error: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:560 hl_fw_cpucp_pll_info_get()=
 error: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:833 hl_fw_init_cpu() warn: mis=
sing error code 'rc'

vim +/result +586 drivers/misc/habanalabs/common/firmware_if.c

1cbca899fa5763 Ofir Bitton 2020-10-05  567  =

586f2caf0ef952 Sagiv Ozeri 2021-02-23  568  int hl_fw_cpucp_power_get(struc=
t hl_device *hdev, u64 *power)
586f2caf0ef952 Sagiv Ozeri 2021-02-23  569  {
586f2caf0ef952 Sagiv Ozeri 2021-02-23  570  	struct cpucp_packet pkt;
586f2caf0ef952 Sagiv Ozeri 2021-02-23  571  	u64 result;
586f2caf0ef952 Sagiv Ozeri 2021-02-23  572  	int rc;
586f2caf0ef952 Sagiv Ozeri 2021-02-23  573  =

586f2caf0ef952 Sagiv Ozeri 2021-02-23  574  	memset(&pkt, 0, sizeof(pkt));
586f2caf0ef952 Sagiv Ozeri 2021-02-23  575  =

586f2caf0ef952 Sagiv Ozeri 2021-02-23  576  	pkt.ctl =3D cpu_to_le32(CPUCP_=
PACKET_POWER_GET <<
586f2caf0ef952 Sagiv Ozeri 2021-02-23  577  				CPUCP_PKT_CTL_OPCODE_SHIFT);
586f2caf0ef952 Sagiv Ozeri 2021-02-23  578  =

586f2caf0ef952 Sagiv Ozeri 2021-02-23  579  	rc =3D hdev->asic_funcs->send_=
cpu_message(hdev, (u32 *) &pkt, sizeof(pkt),
586f2caf0ef952 Sagiv Ozeri 2021-02-23  580  			HL_CPUCP_INFO_TIMEOUT_USEC, =
&result);
586f2caf0ef952 Sagiv Ozeri 2021-02-23  581  	if (rc) {
586f2caf0ef952 Sagiv Ozeri 2021-02-23  582  		dev_err(hdev->dev, "Failed to=
 read power, error %d\n", rc);
586f2caf0ef952 Sagiv Ozeri 2021-02-23  583  		return rc;
586f2caf0ef952 Sagiv Ozeri 2021-02-23  584  	}
586f2caf0ef952 Sagiv Ozeri 2021-02-23  585  =

586f2caf0ef952 Sagiv Ozeri 2021-02-23 @586  	*power =3D result;
586f2caf0ef952 Sagiv Ozeri 2021-02-23  587  =

586f2caf0ef952 Sagiv Ozeri 2021-02-23  588  	return rc;
586f2caf0ef952 Sagiv Ozeri 2021-02-23  589  }
586f2caf0ef952 Sagiv Ozeri 2021-02-23  590  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7379053097725284054==--

