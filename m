Content-Type: multipart/mixed; boundary="===============1855164960688828403=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/firmware_if.c:467 hl_fw_send_msi_info_msg() error: uninitialized symbol 'result'.
Date: Tue, 14 Dec 2021 07:20:53 +0800
Message-ID: <202112140728.jZdhFChN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1855164960688828403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ohad Sharabi <osharabi@habana.ai>
CC: Oded Gabbay <ogabbay@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2585cf9dfaaddf00b069673f27bb3f8530e2039c
commit: e9c2003be4d4809c7e3bf17167ef08a3be7b43d2 habanalabs: send dynamic m=
si-x indexes to f/w
date:   8 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-m001-20211207 (https://download.01.org/0day-ci/ar=
chive/20211214/202112140728.jZdhFChN-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/misc/habanalabs/common/firmware_if.c:467 hl_fw_send_msi_info_msg() =
error: uninitialized symbol 'result'.

Old smatch warnings:
drivers/misc/habanalabs/common/firmware_if.c:122 hl_fw_send_cpu_message() e=
rror: uninitialized symbol 'pkt_dma_addr'.
drivers/misc/habanalabs/common/firmware_if.c:243 hl_fw_test_cpu_queue() err=
or: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:286 hl_fw_send_heartbeat() err=
or: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:385 hl_fw_cpucp_info_get() err=
or: uninitialized symbol 'cpucp_info_dma_addr'.
drivers/misc/habanalabs/common/firmware_if.c:513 hl_fw_get_eeprom_data() er=
ror: uninitialized symbol 'eeprom_info_dma_addr'.
drivers/misc/habanalabs/common/firmware_if.c:527 hl_fw_get_eeprom_data() er=
ror: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:555 hl_fw_cpucp_pci_counters_g=
et() error: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:607 hl_fw_cpucp_total_energy_g=
et() error: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:675 hl_fw_cpucp_pll_info_get()=
 error: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:701 hl_fw_cpucp_power_get() er=
ror: uninitialized symbol 'result'.
drivers/misc/habanalabs/common/firmware_if.c:948 hl_fw_init_cpu() warn: mis=
sing error code 'rc'

vim +/result +467 drivers/misc/habanalabs/common/firmware_if.c

3110c60fdc7a5a drivers/misc/habanalabs/firmware_if.c        Tomer Tayar  20=
19-03-04  424  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  425  static int hl_fw_send_msi_info_msg(struct hl_device *hdev)
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  426  {
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  427  	struct cpucp_array_data_packet *pkt;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  428  	size_t total_pkt_size, data_size;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  429  	u64 result;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  430  	int rc;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  431  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  432  	/* skip sending this info for unsupported ASICs */
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  433  	if (!hdev->asic_funcs->get_msi_info)
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  434  		return 0;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  435  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  436  	data_size =3D CPUCP_NUM_OF_MSI_TYPES * sizeof(u32);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  437  	total_pkt_size =3D sizeof(struct cpucp_array_data_packet) +=
 data_size;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  438  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  439  	/* data should be aligned to 8 bytes in order to CPU-CP to =
copy it */
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  440  	total_pkt_size =3D (total_pkt_size + 0x7) & ~0x7;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  441  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  442  	/* total_pkt_size is casted to u16 later on */
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  443  	if (total_pkt_size > USHRT_MAX) {
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  444  		dev_err(hdev->dev, "CPUCP array data is too big\n");
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  445  		return -EINVAL;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  446  	}
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  447  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  448  	pkt =3D kzalloc(total_pkt_size, GFP_KERNEL);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  449  	if (!pkt)
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  450  		return -ENOMEM;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  451  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  452  	pkt->length =3D cpu_to_le32(CPUCP_NUM_OF_MSI_TYPES);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  453  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  454  	hdev->asic_funcs->get_msi_info((u32 *)&pkt->data);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  455  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  456  	pkt->cpucp_pkt.ctl =3D cpu_to_le32(CPUCP_PACKET_MSI_INFO_SE=
T <<
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  457  						CPUCP_PKT_CTL_OPCODE_SHIFT);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  458  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  459  	rc =3D hdev->asic_funcs->send_cpu_message(hdev, (u32 *)pkt,
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  460  						total_pkt_size, 0, &result);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  461  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  462  	/*
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  463  	 * in case packet result is invalid it means that FW does n=
ot support
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  464  	 * this feature and will use default/hard coded MSI values.=
 no reason
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  465  	 * to stop the boot
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  466  	 */
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22 @467  	if (rc && result =3D=3D cpucp_packet_invalid)
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  468  		rc =3D 0;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  469  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  470  	if (rc)
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  471  		dev_err(hdev->dev, "failed to send CPUCP array data\n");
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  472  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  473  	kfree(pkt);
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  474  =

e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  475  	return rc;
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  476  }
e9c2003be4d480 drivers/misc/habanalabs/common/firmware_if.c Ohad Sharabi 20=
21-03-22  477  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1855164960688828403==--

