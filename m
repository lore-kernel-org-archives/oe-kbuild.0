Content-Type: multipart/mixed; boundary="===============0944494626663321872=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/usb/gadget/udc/aspeed-vhub/ep0.c:155 ast_vhub_ep0_handle_setup() error: we previously assumed 'ep->dev' could be null (see line 130)
Date: Mon, 24 Jan 2022 03:17:04 +0800
Message-ID: <202201240359.kmhnvTN7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0944494626663321872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e783362eb54cd99b2cac8b3a9aeac942e6f6ac07
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-m031-20220120 (https://download.01.org/0day-ci=
/archive/20220124/202201240359.kmhnvTN7-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/gadget/udc/aspeed-vhub/ep0.c:155 ast_vhub_ep0_handle_setup() er=
ror: we previously assumed 'ep->dev' could be null (see line 130)
drivers/reset/core.c:225 reset_control_array_rearm() error: 'rstc' derefere=
ncing possible ERR_PTR()
drivers/interconnect/core.c:777 icc_put() error: 'path' dereferencing possi=
ble ERR_PTR()
sound/soc/samsung/i2s.c:576 i2s_set_sysclk() warn: passing zero to 'PTR_ERR'
net/kcm/kcmsock.c:645 kcm_write_msgs() error: we previously assumed 'psock'=
 could be null (see line 585)
kernel/rcu/update.c:546 early_boot_test_call_rcu() warn: possible memory le=
ak of 'rhp'
drivers/gpu/drm/gud/gud_pipe.c:468 gud_pipe_check() error: we previously as=
sumed 'connector_state' could be null (see line 438)
drivers/gpu/drm/panfrost/panfrost_mmu.c:293 panfrost_mmu_map() warn: passin=
g zero to 'PTR_ERR'
drivers/gpu/drm/gud/gud_connector.c:571 gud_connector_add_properties() erro=
r: 'state_val' dereferencing possible ERR_PTR()
drivers/gpu/drm/gud/gud_connector.c:597 gud_connector_fill_properties() war=
n: passing zero to 'PTR_ERR'
drivers/clk/imx/clk-imx8mq.c:399 imx8mq_clocks_probe() warn: passing zero t=
o 'PTR_ERR'
kernel/sched/topology.c:1338 asym_cpu_capacity_update_data() warn: possible=
 memory leak of 'entry'
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/gpu/drm/vc4/vc4_txp.c:303 vc4_txp_connector_atomic_commit() error: =
buffer overflow 'txp_fmts' 10 <=3D 10 (assuming for loop doesn't break)
drivers/infiniband/core/uverbs_uapi.c:77 uapi_create_write() error: potenti=
ally using uninitialized 'exists'.
kernel/tracepoint.c:325 tracepoint_remove_func() warn: passing zero to 'PTR=
_ERR'
drivers/gpu/drm/drm_modeset_lock.c:103 drm_modeset_lock_all() warn: possibl=
e memory leak of 'ctx'
drivers/gpu/drm/drm_writeback.c:385 drm_writeback_signal_completion() error=
: we previously assumed 'job' could be null (see line 377)
drivers/gpu/drm/drm_atomic_uapi.c:196 drm_atomic_set_crtc_for_plane() warn:=
 passing zero to 'PTR_ERR'
drivers/gpu/drm/drm_atomic_uapi.c:198 drm_atomic_set_crtc_for_plane() error=
: 'crtc_state' dereferencing possible ERR_PTR()

Old smatch warnings:
drivers/gpu/drm/gud/gud_pipe.c:544 gud_pipe_update() error: we previously a=
ssumed 'fb' could be null (see line 536)
drivers/infiniband/core/uverbs_uapi.c:114 uapi_merge_method() error: uninit=
ialized symbol 'exists'.

vim +155 drivers/usb/gadget/udc/aspeed-vhub/ep0.c

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   84  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   85  void ast_vhub_ep0_ha=
ndle_setup(struct ast_vhub_ep *ep)
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   86  {
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   87  	struct usb_ctrlrequ=
est crq;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   88  	enum std_req_rc std=
_req_rc;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   89  	int rc =3D -ENODEV;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   90  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   91  	if (WARN_ON(ep->d_i=
dx !=3D 0))
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   92  		return;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   93  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   94  	/*
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   95  	 * Grab the setup p=
acket from the chip and byteswap
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   96  	 * interesting fiel=
ds
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   97  	 */
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   98  	memcpy_fromio(&crq,=
 ep->ep0.setup, sizeof(crq));
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04   99  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  100  	EPDBG(ep, "SETUP pa=
cket %02x/%02x/%04x/%04x/%04x [%s] st=3D%d\n",
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  101  	      crq.bRequestT=
ype, crq.bRequest,
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  102  	       le16_to_cpu(=
crq.wValue),
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  103  	       le16_to_cpu(=
crq.wIndex),
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  104  	       le16_to_cpu(=
crq.wLength),
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  105  	       (crq.bReques=
tType & USB_DIR_IN) ? "in" : "out",
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  106  	       ep->ep0.stat=
e);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  107  =

9196b55e1270da Benjamin Herrenschmidt 2018-06-28  108  	/*
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  109  	 * Check our state,=
 cancel pending requests if needed
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  110  	 *
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  111  	 * Note: Under some=
 circumstances, we can get a new setup
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  112  	 * packet while wai=
ting for the stall ack, just accept it.
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  113  	 *
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  114  	 * In any case, a S=
ETUP packet in wrong state should have
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  115  	 * reset the HW sta=
te machine, so let's just log, nuke
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  116  	 * requests, move o=
n.
9196b55e1270da Benjamin Herrenschmidt 2018-06-28  117  	 */
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  118  	if (ep->ep0.state !=
=3D ep0_state_token &&
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  119  	    ep->ep0.state !=
=3D ep0_state_stall) {
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  120  		EPDBG(ep, "wrong s=
tate\n");
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  121  		ast_vhub_nuke(ep, =
-EIO);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  122  	}
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  123  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  124  	/* Calculate next s=
tate for EP0 */
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  125  	ep->ep0.state =3D e=
p0_state_data;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  126  	ep->ep0.dir_in =3D =
!!(crq.bRequestType & USB_DIR_IN);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  127  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  128  	/* If this is the v=
Hub, we handle requests differently */
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  129  	std_req_rc =3D std_=
req_driver;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04 @130  	if (ep->dev =3D=3D =
NULL) {
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  131  		if ((crq.bRequestT=
ype & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  132  			std_req_rc =3D as=
t_vhub_std_hub_request(ep, &crq);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  133  		else if ((crq.bReq=
uestType & USB_TYPE_MASK) =3D=3D USB_TYPE_CLASS)
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  134  			std_req_rc =3D as=
t_vhub_class_hub_request(ep, &crq);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  135  		else
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  136  			std_req_rc =3D st=
d_req_stall;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  137  	} else if ((crq.bRe=
questType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  138  		std_req_rc =3D ast=
_vhub_std_dev_request(ep, &crq);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  139  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  140  	/* Act upon result =
*/
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  141  	switch(std_req_rc) {
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  142  	case std_req_comple=
te:
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  143  		goto complete;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  144  	case std_req_stall:
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  145  		goto stall;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  146  	case std_req_driver:
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  147  		break;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  148  	case std_req_data:
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  149  		return;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  150  	}
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  151  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  152  	/* Pass request up =
to the gadget driver */
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  153  	if (WARN_ON(!ep->de=
v))
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  154  		goto stall;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04 @155  	if (ep->dev->driver=
) {
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  156  		EPDBG(ep, "forward=
ing to gadget...\n");
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  157  		spin_unlock(&ep->v=
hub->lock);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  158  		rc =3D ep->dev->dr=
iver->setup(&ep->dev->gadget, &crq);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  159  		spin_lock(&ep->vhu=
b->lock);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  160  		EPDBG(ep, "driver =
returned %d\n", rc);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  161  	} else {
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  162  		EPDBG(ep, "no gadg=
et for request !\n");
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  163  	}
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  164  	if (rc >=3D 0)
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  165  		return;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  166  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  167   stall:
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  168  	EPDBG(ep, "stalling=
\n");
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  169  	writel(VHUB_EP0_CTR=
L_STALL, ep->ep0.ctlstat);
7e420cef9047dc Benjamin Herrenschmidt 2019-07-26  170  	ep->ep0.state =3D e=
p0_state_stall;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  171  	ep->ep0.dir_in =3D =
false;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  172  	return;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  173  =

7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  174   complete:
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  175  	EPVDBG(ep, "sending=
 [in] status with no data\n");
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  176  	writel(VHUB_EP0_TX_=
BUFF_RDY, ep->ep0.ctlstat);
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  177  	ep->ep0.state =3D e=
p0_state_status;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  178  	ep->ep0.dir_in =3D =
false;
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  179  }
7ecca2a4080cb6 Benjamin Herrenschmidt 2018-05-04  180  =


:::::: The code at line 155 was first introduced by commit
:::::: 7ecca2a4080cb6b1fa174adc588fce9e9014c43c usb/gadget: Add driver for =
Aspeed SoC virtual hub

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Felipe Balbi <felipe.balbi@linux.intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0944494626663321872==--

