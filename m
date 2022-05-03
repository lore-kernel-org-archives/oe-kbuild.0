Content-Type: multipart/mixed; boundary="===============0538450946178381492=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/hid/intel-ish-hid/ishtp-fw-loader.c:714 ish_fw_xfer_direct_dma() error: uninitialized symbol 'rv'.
Date: Tue, 03 May 2022 22:04:34 +0800
Message-ID: <202205032255.N3NS7V5y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0538450946178381492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Gwendal Grignou <gwendal@chromium.org>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9050ba3a61a4b5bd84c2cde092a100404f814f31
commit: f97ec5d75e9261a5da78dc28a8955b7cc0c4468b HID: intel-ish-hid: Use dm=
a_alloc_coherent for firmware update
date:   7 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001-20220502 (https://download.01.org/0day-ci/ar=
chive/20220503/202205032255.N3NS7V5y-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hid/intel-ish-hid/ishtp-fw-loader.c:714 ish_fw_xfer_direct_dma() er=
ror: uninitialized symbol 'rv'.

vim +/rv +714 drivers/hid/intel-ish-hid/ishtp-fw-loader.c

91b228107da3e4 Rushikesh S Kadam 2019-04-02  618  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  619  /**
91b228107da3e4 Rushikesh S Kadam 2019-04-02  620   * ish_fw_xfer_direct_dma=
() - Loads ISH firmware using direct dma
91b228107da3e4 Rushikesh S Kadam 2019-04-02  621   * @client_data:	Client d=
ata instance
91b228107da3e4 Rushikesh S Kadam 2019-04-02  622   * @fw:			Pointer to firm=
ware data struct in host memory
91b228107da3e4 Rushikesh S Kadam 2019-04-02  623   * @fw_info:		Loader firm=
ware properties
91b228107da3e4 Rushikesh S Kadam 2019-04-02  624   *
91b228107da3e4 Rushikesh S Kadam 2019-04-02  625   * Host firmware load is =
a unique case where we need to download
91b228107da3e4 Rushikesh S Kadam 2019-04-02  626   * a large firmware image=
 (200+ Kb). This function implements
91b228107da3e4 Rushikesh S Kadam 2019-04-02  627   * direct DMA transfer in=
 kernel and ISH firmware. This allows
91b228107da3e4 Rushikesh S Kadam 2019-04-02  628   * us to overcome the ISH=
-TP 4 Kb limit, and allows us to DMA
91b228107da3e4 Rushikesh S Kadam 2019-04-02  629   * directly to ISH UMA at=
 location of choice.
91b228107da3e4 Rushikesh S Kadam 2019-04-02  630   * Function depends on co=
rresponding support in ISH firmware.
91b228107da3e4 Rushikesh S Kadam 2019-04-02  631   *
91b228107da3e4 Rushikesh S Kadam 2019-04-02  632   * Return: 0 for success,=
 negative error code for failure.
91b228107da3e4 Rushikesh S Kadam 2019-04-02  633   */
91b228107da3e4 Rushikesh S Kadam 2019-04-02  634  static int ish_fw_xfer_di=
rect_dma(struct ishtp_cl_data *client_data,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  635  				  const struct firmwa=
re *fw,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  636  				  const struct shim_f=
w_info fw_info)
91b228107da3e4 Rushikesh S Kadam 2019-04-02  637  {
91b228107da3e4 Rushikesh S Kadam 2019-04-02  638  	int rv;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  639  	void *dma_buf;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  640  	dma_addr_t dma_buf_phy;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  641  	u32 fragment_offset, fra=
gment_size, payload_max_size;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  642  	struct loader_msg_hdr ld=
r_xfer_dma_frag_ack;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  643  	struct loader_xfer_dma_f=
ragment ldr_xfer_dma_frag;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  644  	struct device *devc =3D =
ishtp_get_pci_device(client_data->cl_device);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  645  	u32 shim_fw_buf_size =3D
91b228107da3e4 Rushikesh S Kadam 2019-04-02  646  		fw_info.ldr_capability.=
max_dma_buf_size;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  647  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  648  	/*
91b228107da3e4 Rushikesh S Kadam 2019-04-02  649  	 * payload_max_size shou=
ld be set to minimum of
91b228107da3e4 Rushikesh S Kadam 2019-04-02  650  	 *  (1) Size of firmware=
 to be loaded,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  651  	 *  (2) Max DMA buffer s=
ize supported by Shim firmware,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  652  	 *  (3) DMA buffer size =
limit set by boot_param dma_buf_size_limit.
91b228107da3e4 Rushikesh S Kadam 2019-04-02  653  	 */
91b228107da3e4 Rushikesh S Kadam 2019-04-02  654  	payload_max_size =3D min=
3(fw->size,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  655  				(size_t)shim_fw_buf_s=
ize,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  656  				(size_t)dma_buf_size_=
limit);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  657  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  658  	/*
91b228107da3e4 Rushikesh S Kadam 2019-04-02  659  	 * Buffer size should be=
 multiple of cacheline size
91b228107da3e4 Rushikesh S Kadam 2019-04-02  660  	 * if it's not, select t=
he previous cacheline boundary.
91b228107da3e4 Rushikesh S Kadam 2019-04-02  661  	 */
91b228107da3e4 Rushikesh S Kadam 2019-04-02  662  	payload_max_size &=3D ~(=
L1_CACHE_BYTES - 1);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  663  =

f97ec5d75e9261 Gwendal Grignou   2022-02-08  664  	dma_buf =3D dma_alloc_co=
herent(devc, payload_max_size, &dma_buf_phy, GFP_KERNEL);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  665  	if (!dma_buf) {
91b228107da3e4 Rushikesh S Kadam 2019-04-02  666  		client_data->flag_retry=
 =3D true;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  667  		return -ENOMEM;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  668  	}
91b228107da3e4 Rushikesh S Kadam 2019-04-02  669  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  670  	ldr_xfer_dma_frag.fragme=
nt.hdr.command =3D LOADER_CMD_XFER_FRAGMENT;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  671  	ldr_xfer_dma_frag.fragme=
nt.xfer_mode =3D LOADER_XFER_MODE_DIRECT_DMA;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  672  	ldr_xfer_dma_frag.ddr_ph=
ys_addr =3D (u64)dma_buf_phy;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  673  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  674  	/* Send the firmware ima=
ge in chucks of payload_max_size */
91b228107da3e4 Rushikesh S Kadam 2019-04-02  675  	fragment_offset =3D 0;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  676  	while (fragment_offset <=
 fw->size) {
91b228107da3e4 Rushikesh S Kadam 2019-04-02  677  		if (fragment_offset + p=
ayload_max_size < fw->size) {
91b228107da3e4 Rushikesh S Kadam 2019-04-02  678  			fragment_size =3D payl=
oad_max_size;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  679  			ldr_xfer_dma_frag.frag=
ment.is_last =3D 0;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  680  		} else {
91b228107da3e4 Rushikesh S Kadam 2019-04-02  681  			fragment_size =3D fw->=
size - fragment_offset;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  682  			ldr_xfer_dma_frag.frag=
ment.is_last =3D 1;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  683  		}
91b228107da3e4 Rushikesh S Kadam 2019-04-02  684  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  685  		ldr_xfer_dma_frag.fragm=
ent.offset =3D fragment_offset;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  686  		ldr_xfer_dma_frag.fragm=
ent.size =3D fragment_size;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  687  		memcpy(dma_buf, &fw->da=
ta[fragment_offset], fragment_size);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  688  =

f97ec5d75e9261 Gwendal Grignou   2022-02-08  689  		/* Flush cache to be su=
re the data is in main memory. */
91b228107da3e4 Rushikesh S Kadam 2019-04-02  690  		clflush_cache_range(dma=
_buf, payload_max_size);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  691  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  692  		dev_dbg(cl_data_to_dev(=
client_data),
91b228107da3e4 Rushikesh S Kadam 2019-04-02  693  			"xfer_mode=3Ddma offse=
t=3D0x%08x size=3D0x%x is_last=3D%d ddr_phys_addr=3D0x%016llx\n",
91b228107da3e4 Rushikesh S Kadam 2019-04-02  694  			ldr_xfer_dma_frag.frag=
ment.offset,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  695  			ldr_xfer_dma_frag.frag=
ment.size,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  696  			ldr_xfer_dma_frag.frag=
ment.is_last,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  697  			ldr_xfer_dma_frag.ddr_=
phys_addr);
91b228107da3e4 Rushikesh S Kadam 2019-04-02  698  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  699  		rv =3D loader_cl_send(c=
lient_data,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  700  				    (u8 *)&ldr_xfer_d=
ma_frag,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  701  				    sizeof(ldr_xfer_d=
ma_frag),
91b228107da3e4 Rushikesh S Kadam 2019-04-02  702  				    (u8 *)&ldr_xfer_d=
ma_frag_ack,
91b228107da3e4 Rushikesh S Kadam 2019-04-02  703  				    sizeof(ldr_xfer_d=
ma_frag_ack));
91b228107da3e4 Rushikesh S Kadam 2019-04-02  704  		if (rv < 0) {
91b228107da3e4 Rushikesh S Kadam 2019-04-02  705  			client_data->flag_retr=
y =3D true;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  706  			goto end_err_resp_buf_=
release;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  707  		}
91b228107da3e4 Rushikesh S Kadam 2019-04-02  708  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  709  		fragment_offset +=3D fr=
agment_size;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  710  	}
91b228107da3e4 Rushikesh S Kadam 2019-04-02  711  =

91b228107da3e4 Rushikesh S Kadam 2019-04-02  712  end_err_resp_buf_release:
f97ec5d75e9261 Gwendal Grignou   2022-02-08  713  	dma_free_coherent(devc, =
payload_max_size, dma_buf, dma_buf_phy);
91b228107da3e4 Rushikesh S Kadam 2019-04-02 @714  	return rv;
91b228107da3e4 Rushikesh S Kadam 2019-04-02  715  }
91b228107da3e4 Rushikesh S Kadam 2019-04-02  716  =


:::::: The code at line 714 was first introduced by commit
:::::: 91b228107da3e41558449a62cd93816b47b3b4b5 HID: intel-ish-hid: ISH fir=
mware loader client driver

:::::: TO: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0538450946178381492==--

