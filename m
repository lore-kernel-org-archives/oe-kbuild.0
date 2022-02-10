Content-Type: multipart/mixed; boundary="===============5501666492007642991=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 784/923] drivers/gpu/drm/xlnx/xlnx_dptx.c:3187:4-10: ERROR: missing put_device; call of_find_device_by_node on line 3176, but without a corresponding object release within this function.
Date: Fri, 11 Feb 2022 05:17:55 +0800
Message-ID: <202202110504.bzKtGDZS-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5501666492007642991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Rajesh Gugulothu <gugulothu.rajesh@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Hyun Kwon <hyun.kwon@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   966124532656bc95d781abf57531e4cd4f962237
commit: c1b7addf0028e99aeb94afa8ffc106926b0696d9 [784/923] drm: xlnx: dptx:=
 Add DisplayPort tx driver
:::::: branch date: 13 hours ago
:::::: commit date: 10 days ago
config: alpha-randconfig-c024-20220208 (https://download.01.org/0day-ci/arc=
hive/20220211/202202110504.bzKtGDZS-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xlnx/xlnx_dptx.c:3187:4-10: ERROR: missing put_device; c=
all of_find_device_by_node on line 3176, but without a corresponding object=
 release within this function.
   drivers/gpu/drm/xlnx/xlnx_dptx.c:3195:2-8: ERROR: missing put_device; ca=
ll of_find_device_by_node on line 3176, but without a corresponding object =
release within this function.
   drivers/gpu/drm/xlnx/xlnx_dptx.c:3221:5-11: ERROR: missing put_device; c=
all of_find_device_by_node on line 3176, but without a corresponding object=
 release within this function.
   drivers/gpu/drm/xlnx/xlnx_dptx.c:3236:3-9: ERROR: missing put_device; ca=
ll of_find_device_by_node on line 3176, but without a corresponding object =
release within this function.
   drivers/gpu/drm/xlnx/xlnx_dptx.c:3242:2-8: ERROR: missing put_device; ca=
ll of_find_device_by_node on line 3176, but without a corresponding object =
release within this function.
   drivers/gpu/drm/xlnx/xlnx_dptx.c:3283:1-7: ERROR: missing put_device; ca=
ll of_find_device_by_node on line 3176, but without a corresponding object =
release within this function.
   drivers/gpu/drm/xlnx/xlnx_dptx.c:3297:1-7: ERROR: missing put_device; ca=
ll of_find_device_by_node on line 3176, but without a corresponding object =
release within this function.

vim +3187 drivers/gpu/drm/xlnx/xlnx_dptx.c

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3125  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3126  static int xlnx_dp_probe(=
struct platform_device *pdev)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3127  {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3128  	struct device_node *pnod=
e =3D pdev->dev.of_node;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3129  	struct device_node *fnod=
e;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3130  	struct platform_device *=
iface_pdev;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3131  	struct xlnx_dp *dp;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3132  	struct resource *res;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3133  	void *ptr;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3134  	unsigned int i;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3135  	int irq, ret;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3136  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3137  	dp =3D devm_kzalloc(&pde=
v->dev, sizeof(*dp), GFP_KERNEL);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3138  	if (!dp)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3139  		return -ENOMEM;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3140  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3141  	dp->tx_audio_data =3D
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3142  		devm_kzalloc(&pdev->dev=
, sizeof(struct xlnx_dptx_audio_data),
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3143  			     GFP_KERNEL);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3144  	if (!dp->tx_audio_data)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3145  		return -ENOMEM;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3146  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3147  	dp->dpms =3D DRM_MODE_DP=
MS_OFF;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3148  	dp->status =3D connector=
_status_disconnected;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3149  	dp->dev =3D &pdev->dev;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3150  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3151  	res =3D platform_get_res=
ource_byname(pdev, IORESOURCE_MEM, "dp_base");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3152  	dp->dp_base =3D devm_ior=
emap_resource(dp->dev, res);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3153  	if (IS_ERR(dp->dp_base))=
 {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3154  		dev_err(&pdev->dev, "co=
uldn't map DisplayPort registers\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3155  		return -ENODEV;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3156  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3157  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3158  	ret =3D xlnx_dp_parse_of=
(dp);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3159  	if (ret < 0)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3160  		return ret;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3161  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3162  	if (dp->config.versal_gt=
_present) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3163  		dp->phy[0] =3D devm_phy=
_get(dp->dev, "dp-gtquad");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3164  		if (IS_ERR(dp->phy[0]))
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3165  			return dev_err_probe(d=
p->dev, ret, "failed to get phy\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3166  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3167  		ret =3D phy_init(dp->ph=
y[0]);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3168  		if (ret)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3169  			goto error_phy;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3170  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3171  		fnode =3D of_parse_phan=
dle(pnode, "xlnx,xilinx-vfmc", 0);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3172  		if (!fnode) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3173  			dev_err(&pdev->dev, "p=
latform node not found\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3174  			of_node_put(fnode);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3175  		} else {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24 @3176  			iface_pdev =3D of_find=
_device_by_node(fnode);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3177  			if (!iface_pdev) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3178  				of_node_put(pnode);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3179  				return -ENODEV;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3180  			}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3181  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3182  			ptr =3D dev_get_drvdat=
a(&iface_pdev->dev);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3183  			if (!ptr) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3184  				dev_info(&pdev->dev,
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3185  					 "platform device no=
t found -EPROBE_DEFER\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3186  				of_node_put(fnode);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24 @3187  				return -EPROBE_DEFER;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3188  			}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3189  			of_node_put(fnode);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3190  		}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3191  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3192  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3193  	dp->axi_lite_clk =3D dev=
m_clk_get(&pdev->dev, "s_axi_aclk");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3194  	if (IS_ERR(dp->axi_lite_=
clk))
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3195  		return PTR_ERR(dp->axi_=
lite_clk);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3196  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3197  	dp->tx_vid_clk =3D devm_=
clk_get(&pdev->dev, "tx_vid_clk");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3198  	if (IS_ERR(dp->tx_vid_cl=
k))
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3199  		dev_err(dp->dev, "faile=
d to get vid clk stream1\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3200  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3201  	platform_set_drvdata(pde=
v, dp);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3202  	xlnx_dp_write(dp->dp_bas=
e, XDPTX_ENABLE_REG, 0);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3203  	xlnx_dp_write(dp->dp_bas=
e, XDPTX_MAINSTRM_ENABLE_REG, 0);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3204  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3205  	dp->tx_link_config.vs_le=
vel =3D 0;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3206  	dp->tx_link_config.pe_le=
vel =3D 0;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3207  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3208  	if (!dp->config.versal_g=
t_present) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3209  		/* acquire vphy lanes */
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3210  		for (i =3D 0; i < dp->c=
onfig.max_lanes; i++) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3211  			char phy_name[16];
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3212  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3213  			snprintf(phy_name, siz=
eof(phy_name), "dp-phy%d", i);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3214  			dp->phy[i] =3D devm_ph=
y_get(dp->dev, phy_name);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3215  			if (IS_ERR(dp->phy[i])=
) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3216  				ret =3D PTR_ERR(dp->p=
hy[i]);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3217  				dp->phy[i] =3D NULL;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3218  				if (ret =3D=3D -EPROB=
E_DEFER) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3219  					dev_info(dp->dev,
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3220  						 "xvphy not ready -=
EPROBE_DEFER\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3221  					return ret;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3222  				}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3223  				if (ret !=3D -EPROBE_=
DEFER)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3224  					dev_err(dp->dev, "fa=
iled to get phy lane %s i %d, error %d\n",
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3225  						phy_name, i, ret);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3226  				goto error_phy;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3227  			}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3228  		}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3229  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3230  		ret =3D xlnx_dp_init_ph=
y(dp);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3231  		if (ret)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3232  			goto error_phy;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3233  	} else {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3234  		ret =3D xlnx_dp_tx_gt_c=
ontrol_init(dp);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3235  		if (ret < 0)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3236  			return ret;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3237  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3238  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3239  	ret =3D clk_prepare_enab=
le(dp->axi_lite_clk);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3240  	if (ret) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3241  		dev_err(dp->dev, "faile=
d to enable axi_lite_clk (%d)\n", ret);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3242  		return ret;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3243  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3244  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3245  	ret =3D clk_prepare_enab=
le(dp->tx_vid_clk);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3246  	if (ret) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3247  		dev_err(dp->dev, "faile=
d to enable tx_vid_clk (%d)\n", ret);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3248  		goto tx_vid_clk_err;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3249  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3250  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3251  	dp->aux.name =3D "Xlnx D=
P AUX";
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3252  	dp->aux.dev =3D dp->dev;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3253  	dp->aux.transfer =3D xln=
x_dp_aux_transfer;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3254  	ret =3D drm_dp_aux_regis=
ter(&dp->aux);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3255  	if (ret < 0) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3256  		dev_err(dp->dev, "faile=
d to initialize DP aux\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3257  		goto error;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3258  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3259  	irq =3D platform_get_irq=
(pdev, 0);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3260  	if (irq < 0) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3261  		ret =3D irq;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3262  		goto error;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3263  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3264  	ret =3D devm_request_thr=
eaded_irq(dp->dev, irq, NULL,
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3265  					xlnx_dp_irq_handler,=
 IRQF_ONESHOT,
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3266  					dev_name(dp->dev), d=
p);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3267  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3268  	if (ret < 0)
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3269  		goto error;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3270  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3271  	if (dp->config.audio_ena=
bled) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3272  		dp->audio_pdev =3D dptx=
_register_aud_dev(dp->dev);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3273  		if (IS_ERR(dp->audio_pd=
ev)) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3274  			dp->audio_init =3D fal=
se;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3275  			dev_err(dp->dev, "dp t=
x audio init failed\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3276  			goto error;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3277  		} else {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3278  			dp->audio_init =3D tru=
e;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3279  			dev_info(dp->dev, "dp =
tx audio initialized\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3280  		}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3281  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3282  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3283  	return component_add(&pd=
ev->dev, &xlnx_dp_component_ops);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3284  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3285  tx_vid_clk_err:
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3286  	clk_disable_unprepare(dp=
->axi_lite_clk);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3287  error:
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3288  	drm_dp_aux_unregister(&d=
p->aux);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3289  error_phy:
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3290  	if (!dp->config.versal_g=
t_present) {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3291  		dev_dbg(&pdev->dev, "xd=
prxss_probe() error_phy:\n");
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3292  		xlnx_dp_exit_phy(dp);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3293  	} else {
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3294  		phy_exit(dp->phy[0]);
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3295  	}
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3296  =

c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3297  	return ret;
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3298  }
c1b7addf0028e9 Rajesh Gugulothu 2020-08-24  3299  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5501666492007642991==--

