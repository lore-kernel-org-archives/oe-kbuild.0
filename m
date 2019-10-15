Content-Type: multipart/mixed; boundary="===============6471057193061497319=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver
Date: Tue, 15 Oct 2019 12:19:21 +0300
Message-ID: <20191015091921.GC21344@kadam>
In-Reply-To: <55295c49503a963f3417b917fd7163feb26ed0b6.1570760115.git.xji@analogixsemi.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6471057193061497319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[  These are automated text from the 0-day bot -dan ]

Hi Xin,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Xin-Ji/dt-bindings-drm-bri=
dge-anx7625-MIPI-to-DP-transmitter-binding/20191014-043019

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/gpu/drm/bridge/analogix/anx7625.c:1274 anx7625_start_dp_work() erro=
r: uninitialized symbol 'sp_tx_lane_count'.

# https://github.com/0day-ci/linux/commit/152a82b6747f10d6c13c7a422173947c2=
f2e1aa2
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 152a82b6747f10d6c13c7a422173947c2f2e1aa2
vim +/sp_tx_lane_count +1274 drivers/gpu/drm/bridge/analogix/anx7625.c

152a82b6747f10 Xin Ji 2019-10-11  1253  static void anx7625_start_dp_work(s=
truct anx7625_data *ctx)
152a82b6747f10 Xin Ji 2019-10-11  1254  {
152a82b6747f10 Xin Ji 2019-10-11  1255  	int ret;
152a82b6747f10 Xin Ji 2019-10-11  1256  	u8 buf[MAX_DPCD_BUFFER_SIZE];
152a82b6747f10 Xin Ji 2019-10-11  1257  	u8 hdcp_cap;
152a82b6747f10 Xin Ji 2019-10-11  1258  	struct device *dev =3D &ctx->clien=
t->dev;
152a82b6747f10 Xin Ji 2019-10-11  1259  	u8 sp_tx_bw; /* linktraining banwi=
dth */
152a82b6747f10 Xin Ji 2019-10-11  1260  	u8 sp_tx_lane_count; /* link train=
ing lane count */
152a82b6747f10 Xin Ji 2019-10-11  1261  =

152a82b6747f10 Xin Ji 2019-10-11  1262  	if (ctx->hpd_high_cnt >=3D 2) {
152a82b6747f10 Xin Ji 2019-10-11  1263  		DRM_DEV_DEBUG_DRIVER(dev, "anx762=
5 filter useless HPD\n");
152a82b6747f10 Xin Ji 2019-10-11  1264  		return;
152a82b6747f10 Xin Ji 2019-10-11  1265  	}
152a82b6747f10 Xin Ji 2019-10-11  1266  =

152a82b6747f10 Xin Ji 2019-10-11  1267  	ctx->hpd_high_cnt++;
152a82b6747f10 Xin Ji 2019-10-11  1268  =

152a82b6747f10 Xin Ji 2019-10-11  1269  	sp_tx_get_rx_bw(ctx, &sp_tx_bw);
152a82b6747f10 Xin Ji 2019-10-11  1270  =

152a82b6747f10 Xin Ji 2019-10-11  1271  	sp_tx_aux_dpcdread_bytes(ctx, 0x00=
, 0x00, DPCD_MAX_LANE_COUNT,
152a82b6747f10 Xin Ji 2019-10-11  1272  				 1, &sp_tx_lane_count);
                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^
Smatch thinks sp_tx_aux_dpcdread_bytes() can fail and we don't check
for errors.

152a82b6747f10 Xin Ji 2019-10-11  1273  =

152a82b6747f10 Xin Ji 2019-10-11 @1274  	sp_tx_lane_count =3D sp_tx_lane_co=
unt & 0x1f;
152a82b6747f10 Xin Ji 2019-10-11  1275  	sp_tx_aux_dpcdread_bytes(ctx, 0x06=
, 0x80, 0x28, 1, buf);/* read Bcap */
152a82b6747f10 Xin Ji 2019-10-11  1276  =

152a82b6747f10 Xin Ji 2019-10-11  1277  	hdcp_cap =3D buf[0] & 0x01;
152a82b6747f10 Xin Ji 2019-10-11  1278  =


---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============6471057193061497319==--

