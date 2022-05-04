Content-Type: multipart/mixed; boundary="===============2634076654900321830=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/soc/qcom/apr.c:159:16: warning: Uninitialized variable: adev [uninitvar]
Date: Thu, 05 May 2022 03:49:45 +0800
Message-ID: <202205050336.fVmm2tAS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2634076654900321830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a7391ad3572431a354c927cf8896e86e50d7d0bf
commit: 99139b80c1b3d73026ed8be2de42c52e2976ab64 soc: qcom: apr: make code =
more reuseable
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 99139b80c1b3d73026ed8be2de42c52e2976ab64
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/soc/qcom/apr.c:159:16: warning: Uninitialized variable: adev [un=
initvar]
    if (!adrv || !adev) {
                  ^

vim +159 drivers/soc/qcom/apr.c

1ac19ad799f880 Srinivas Kandagatla 2019-02-08  107  =

99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  108  static int apr_do_rx_ca=
llback(struct packet_router *apr, struct apr_rx_buf *abuf)
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  109  {
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  110  	uint16_t hdr_size, msg=
_type, ver, svc_id;
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  111  	struct pkt_router_svc =
*svc;
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  112  	struct apr_device *ade=
v;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  113  	struct apr_driver *adr=
v =3D NULL;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  114  	struct apr_resp_pkt re=
sp;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  115  	struct apr_hdr *hdr;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  116  	unsigned long flags;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  117  	void *buf =3D abuf->bu=
f;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  118  	int len =3D abuf->len;
1ac19ad799f880 Srinivas Kandagatla 2019-02-08  119  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  120  	hdr =3D buf;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  121  	ver =3D APR_HDR_FIELD_=
VER(hdr->hdr_field);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  122  	if (ver > APR_PKT_VER =
+ 1)
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  123  		return -EINVAL;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  124  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  125  	hdr_size =3D APR_HDR_F=
IELD_SIZE_BYTES(hdr->hdr_field);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  126  	if (hdr_size < APR_HDR=
_SIZE) {
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  127  		dev_err(apr->dev, "AP=
R: Wrong hdr size:%d\n", hdr_size);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  128  		return -EINVAL;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  129  	}
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  130  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  131  	if (hdr->pkt_size < AP=
R_HDR_SIZE || hdr->pkt_size !=3D len) {
35aac0ba88d55d Colin Ian King      2018-06-11  132  		dev_err(apr->dev, "AP=
R: Wrong packet size\n");
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  133  		return -EINVAL;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  134  	}
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  135  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  136  	msg_type =3D APR_HDR_F=
IELD_MT(hdr->hdr_field);
e744619d056e6e Srinivas Kandagatla 2018-05-17  137  	if (msg_type >=3D APR_=
MSG_TYPE_MAX) {
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  138  		dev_err(apr->dev, "AP=
R: Wrong message type: %d\n", msg_type);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  139  		return -EINVAL;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  140  	}
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  141  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  142  	if (hdr->src_domain >=
=3D APR_DOMAIN_MAX ||
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  143  			hdr->dest_domain >=
=3D APR_DOMAIN_MAX ||
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  144  			hdr->src_svc >=3D AP=
R_SVC_MAX ||
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  145  			hdr->dest_svc >=3D A=
PR_SVC_MAX) {
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  146  		dev_err(apr->dev, "AP=
R: Wrong APR header\n");
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  147  		return -EINVAL;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  148  	}
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  149  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  150  	svc_id =3D hdr->dest_s=
vc;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  151  	spin_lock_irqsave(&apr=
->svcs_lock, flags);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  152  	svc =3D idr_find(&apr-=
>svcs_idr, svc_id);
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  153  	if (svc && svc->dev->d=
river) {
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  154  		adev =3D svc_to_apr_d=
evice(svc);
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  155  		adrv =3D to_apr_drive=
r(adev->dev.driver);
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  156  	}
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  157  	spin_unlock_irqrestore=
(&apr->svcs_lock, flags);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  158  =

99139b80c1b3d7 Srinivas Kandagatla 2021-09-27 @159  	if (!adrv || !adev) {
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  160  		dev_err(apr->dev, "AP=
R: service is not registered (%d)\n",
99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  161  			svc_id);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  162  		return -EINVAL;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  163  	}
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  164  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  165  	resp.hdr =3D *hdr;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  166  	resp.payload_size =3D =
hdr->pkt_size - hdr_size;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  167  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  168  	/*
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  169  	 * NOTE: hdr_size is n=
ot same as APR_HDR_SIZE as remote can include
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  170  	 * optional headers in=
 to apr_hdr which should be ignored
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  171  	 */
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  172  	if (resp.payload_size =
> 0)
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  173  		resp.payload =3D buf =
+ hdr_size;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  174  =

99139b80c1b3d7 Srinivas Kandagatla 2021-09-27  175  	adrv->callback(adev, &=
resp);
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  176  =

6adba21eb434d8 Srinivas Kandagatla 2018-05-09  177  	return 0;
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  178  }
6adba21eb434d8 Srinivas Kandagatla 2018-05-09  179  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2634076654900321830==--

