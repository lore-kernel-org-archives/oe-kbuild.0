Content-Type: multipart/mixed; boundary="===============0600878867334997476=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/mediatek/mtk_dsi.c:951 mtk_dsi_host_transfer() warn: check sign expansion for 'ret'
Date: Tue, 14 Jun 2022 09:16:31 +0800
Message-ID: <202206140910.aE0Vlhfq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0600878867334997476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Julien STEPHAN <jstephan@baylibre.com>
CC: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
CC: Mattijs Korpershoek <mkorpershoek@baylibre.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 81cc7e51c4f1686b71e30046437056ece6b2cb4d drm/mediatek: Allow comman=
ds to be sent during video mode
date:   4 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-m031-20220613 (https://download.01.org/0day-ci/arc=
hive/20220614/202206140910.aE0Vlhfq-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/mediatek/mtk_dsi.c:951 mtk_dsi_host_transfer() warn: check =
sign expansion for 'ret'

vim +/ret +951 drivers/gpu/drm/mediatek/mtk_dsi.c

21898816831fc6 shaoming chen  2017-03-31  885  =

21898816831fc6 shaoming chen  2017-03-31  886  static ssize_t mtk_dsi_host_=
transfer(struct mipi_dsi_host *host,
21898816831fc6 shaoming chen  2017-03-31  887  				     const struct mipi_d=
si_msg *msg)
21898816831fc6 shaoming chen  2017-03-31  888  {
21898816831fc6 shaoming chen  2017-03-31  889  	struct mtk_dsi *dsi =3D hos=
t_to_dsi(host);
21898816831fc6 shaoming chen  2017-03-31  890  	u32 recv_cnt, i;
21898816831fc6 shaoming chen  2017-03-31  891  	u8 read_data[16];
21898816831fc6 shaoming chen  2017-03-31  892  	void *src_addr;
21898816831fc6 shaoming chen  2017-03-31  893  	u8 irq_flag =3D CMD_DONE_IN=
T_FLAG;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  894  	u32 dsi_mode;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  895  	int ret;
21898816831fc6 shaoming chen  2017-03-31  896  =

81cc7e51c4f168 Julien STEPHAN 2022-02-14  897  	dsi_mode =3D readl(dsi->reg=
s + DSI_MODE_CTRL);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  898  	if (dsi_mode & MODE) {
81cc7e51c4f168 Julien STEPHAN 2022-02-14  899  		mtk_dsi_stop(dsi);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  900  		ret =3D mtk_dsi_switch_to_=
cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  901  		if (ret)
81cc7e51c4f168 Julien STEPHAN 2022-02-14  902  			goto restore_dsi_mode;
21898816831fc6 shaoming chen  2017-03-31  903  	}
21898816831fc6 shaoming chen  2017-03-31  904  =

21898816831fc6 shaoming chen  2017-03-31  905  	if (MTK_DSI_HOST_IS_READ(ms=
g->type))
21898816831fc6 shaoming chen  2017-03-31  906  		irq_flag |=3D LPRX_RD_RDY_=
INT_FLAG;
21898816831fc6 shaoming chen  2017-03-31  907  =

81cc7e51c4f168 Julien STEPHAN 2022-02-14  908  	ret =3D mtk_dsi_host_send_c=
md(dsi, msg, irq_flag);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  909  	if (ret)
81cc7e51c4f168 Julien STEPHAN 2022-02-14  910  		goto restore_dsi_mode;
21898816831fc6 shaoming chen  2017-03-31  911  =

81cc7e51c4f168 Julien STEPHAN 2022-02-14  912  	if (!MTK_DSI_HOST_IS_READ(m=
sg->type)) {
81cc7e51c4f168 Julien STEPHAN 2022-02-14  913  		recv_cnt =3D 0;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  914  		goto restore_dsi_mode;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  915  	}
21898816831fc6 shaoming chen  2017-03-31  916  =

21898816831fc6 shaoming chen  2017-03-31  917  	if (!msg->rx_buf) {
21898816831fc6 shaoming chen  2017-03-31  918  		DRM_ERROR("dsi receive buf=
fer size may be NULL\n");
81cc7e51c4f168 Julien STEPHAN 2022-02-14  919  		ret =3D -EINVAL;
81cc7e51c4f168 Julien STEPHAN 2022-02-14  920  		goto restore_dsi_mode;
21898816831fc6 shaoming chen  2017-03-31  921  	}
21898816831fc6 shaoming chen  2017-03-31  922  =

21898816831fc6 shaoming chen  2017-03-31  923  	for (i =3D 0; i < 16; i++)
21898816831fc6 shaoming chen  2017-03-31  924  		*(read_data + i) =3D readb=
(dsi->regs + DSI_RX_DATA0 + i);
21898816831fc6 shaoming chen  2017-03-31  925  =

21898816831fc6 shaoming chen  2017-03-31  926  	recv_cnt =3D mtk_dsi_recv_c=
nt(read_data[0], read_data);
21898816831fc6 shaoming chen  2017-03-31  927  =

21898816831fc6 shaoming chen  2017-03-31  928  	if (recv_cnt > 2)
21898816831fc6 shaoming chen  2017-03-31  929  		src_addr =3D &read_data[4];
21898816831fc6 shaoming chen  2017-03-31  930  	else
21898816831fc6 shaoming chen  2017-03-31  931  		src_addr =3D &read_data[1];
21898816831fc6 shaoming chen  2017-03-31  932  =

21898816831fc6 shaoming chen  2017-03-31  933  	if (recv_cnt > 10)
21898816831fc6 shaoming chen  2017-03-31  934  		recv_cnt =3D 10;
21898816831fc6 shaoming chen  2017-03-31  935  =

21898816831fc6 shaoming chen  2017-03-31  936  	if (recv_cnt > msg->rx_len)
21898816831fc6 shaoming chen  2017-03-31  937  		recv_cnt =3D msg->rx_len;
21898816831fc6 shaoming chen  2017-03-31  938  =

21898816831fc6 shaoming chen  2017-03-31  939  	if (recv_cnt)
21898816831fc6 shaoming chen  2017-03-31  940  		memcpy(msg->rx_buf, src_ad=
dr, recv_cnt);
21898816831fc6 shaoming chen  2017-03-31  941  =

21898816831fc6 shaoming chen  2017-03-31  942  	DRM_INFO("dsi get %d byte d=
ata from the panel address(0x%x)\n",
21898816831fc6 shaoming chen  2017-03-31  943  		 recv_cnt, *((u8 *)(msg->t=
x_buf)));
21898816831fc6 shaoming chen  2017-03-31  944  =

81cc7e51c4f168 Julien STEPHAN 2022-02-14  945  restore_dsi_mode:
81cc7e51c4f168 Julien STEPHAN 2022-02-14  946  	if (dsi_mode & MODE) {
81cc7e51c4f168 Julien STEPHAN 2022-02-14  947  		mtk_dsi_set_mode(dsi);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  948  		mtk_dsi_start(dsi);
81cc7e51c4f168 Julien STEPHAN 2022-02-14  949  	}
81cc7e51c4f168 Julien STEPHAN 2022-02-14  950  =

81cc7e51c4f168 Julien STEPHAN 2022-02-14 @951  	return ret < 0 ? ret : recv=
_cnt;
21898816831fc6 shaoming chen  2017-03-31  952  }
21898816831fc6 shaoming chen  2017-03-31  953  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0600878867334997476==--

