Content-Type: multipart/mixed; boundary="===============6895867004029336766=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/6] bus: mhi: core: Improvements to the channel handling state machine
Date: Thu, 12 Nov 2020 07:26:43 +0800
Message-ID: <202011120757.TwkVILfW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6895867004029336766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1605122473-12179-3-git-send-email-bbhatt@codeaurora.org>
References: <1605122473-12179-3-git-send-email-bbhatt@codeaurora.org>
TO: Bhaumik Bhatt <bbhatt@codeaurora.org>
TO: manivannan.sadhasivam(a)linaro.org
CC: linux-arm-msm(a)vger.kernel.org
CC: hemantk(a)codeaurora.org
CC: jhugo(a)codeaurora.org
CC: loic.poulain(a)linaro.org
CC: kvalo(a)codeaurora.org
CC: linux-kernel(a)vger.kernel.org
CC: Bhaumik Bhatt <bbhatt@codeaurora.org>

Hi Bhaumik,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20201111]
[cannot apply to linus/master v5.10-rc3 v5.10-rc2 v5.10-rc1 v5.10-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bhaumik-Bhatt/Updates-to-M=
HI-channel-handling/20201112-032330
base:    3e14f70c05cda4794901ed8f976de3a88deebcc0
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/bus/mhi/core/main.c:1277:6: warning: Variable 'ret' is reassigne=
d a value before the old one has been used. 'break;' missing? [redundantAss=
ignInSwitch]
    ret =3D mhi_device_get_sync(mhi_cntrl->mhi_dev);
        ^
   drivers/bus/mhi/core/main.c:1240:0: note: Variable 'ret' is reassigned a=
 value before the old one has been used. 'break;' missing?
    int ret =3D -EIO;
   ^
   drivers/bus/mhi/core/main.c:1277:6: note: Variable 'ret' is reassigned a=
 value before the old one has been used. 'break;' missing?
    ret =3D mhi_device_get_sync(mhi_cntrl->mhi_dev);
        ^

vim +1277 drivers/bus/mhi/core/main.c

189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1233  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1234  static int mhi_upda=
te_channel_state(struct mhi_controller *mhi_cntrl,
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1235  				    struct mhi_=
chan *mhi_chan,
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1236  				    enum mhi_ch=
_state_type to_state)
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1237  {
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1238  	struct device *dev=
 =3D &mhi_cntrl->mhi_dev->dev;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1239  	enum mhi_cmd_type =
cmd =3D MHI_CMD_NOP;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1240  	int ret =3D -EIO;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1241  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1242  	dev_dbg(dev, "Upda=
ting channel %s(%d) state to: %s\n", mhi_chan->name,
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1243  		mhi_chan->chan, T=
O_CH_STATE_TYPE_STR(to_state));
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1244  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1245  	switch (to_state) {
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1246  	case MHI_CH_STATE_=
TYPE_RESET:
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1247  		write_lock_irq(&m=
hi_chan->lock);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1248  		if (mhi_chan->ch_=
state !=3D MHI_CH_STATE_STOP &&
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1249  		    mhi_chan->ch_=
state !=3D MHI_CH_STATE_ENABLED &&
25c142c938991c9 Loic Poulain          2020-10-09  1250  		    mhi_chan->ch_=
state !=3D MHI_CH_STATE_SUSPENDED) {
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1251  			write_unlock_irq=
(&mhi_chan->lock);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1252  			goto exit_invali=
d_state;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1253  		}
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1254  		mhi_chan->ch_stat=
e =3D MHI_CH_STATE_DISABLED;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1255  		write_unlock_irq(=
&mhi_chan->lock);
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1256  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1257  		cmd =3D MHI_CMD_R=
ESET_CHAN;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1258  		break;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1259  	case MHI_CH_STATE_=
TYPE_STOP:
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1260  		if (mhi_chan->ch_=
state !=3D MHI_CH_STATE_ENABLED)
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1261  			goto exit_invali=
d_state;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1262  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1263  		cmd =3D MHI_CMD_S=
TOP_CHAN;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1264  		break;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1265  	case MHI_CH_STATE_=
TYPE_START:
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1266  		if (mhi_chan->ch_=
state !=3D MHI_CH_STATE_STOP &&
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1267  		    mhi_chan->ch_=
state !=3D MHI_CH_STATE_DISABLED)
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1268  			goto exit_invali=
d_state;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1269  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1270  		cmd =3D MHI_CMD_S=
TART_CHAN;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1271  		break;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1272  	default:
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1273  		goto exit_invalid=
_state;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1274  	}
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1275  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1276  	/* bring host and =
device out of suspended states */
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11 @1277  	ret =3D mhi_device=
_get_sync(mhi_cntrl->mhi_dev);
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1278  	if (ret)
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1279  		return ret;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1280  	mhi_cntrl->runtime=
_get(mhi_cntrl);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1281  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1282  	reinit_completion(=
&mhi_chan->completion);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1283  	ret =3D mhi_send_c=
md(mhi_cntrl, mhi_chan, cmd);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1284  	if (ret) {
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1285  		dev_err(dev, "Fai=
led to send %s(%d) %s command\n",
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1286  			mhi_chan->name, =
mhi_chan->chan,
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1287  			TO_CH_STATE_TYPE=
_STR(to_state));
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1288  		goto exit_command=
_failure;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1289  	}
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1290  =

189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1291  	ret =3D wait_for_c=
ompletion_timeout(&mhi_chan->completion,
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1292  				       msecs_to=
_jiffies(mhi_cntrl->timeout_ms));
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1293  	if (!ret || mhi_ch=
an->ccs !=3D MHI_EV_CC_SUCCESS) {
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1294  		dev_err(dev, "Fai=
led to receive %s(%d) %s command completion\n",
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1295  			mhi_chan->name, =
mhi_chan->chan,
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1296  			TO_CH_STATE_TYPE=
_STR(to_state));
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1297  		ret =3D -EIO;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1298  		goto exit_command=
_failure;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1299  	}
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1300  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1301  	ret =3D 0;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1302  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1303  	if (to_state !=3D =
MHI_CH_STATE_TYPE_RESET) {
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1304  		write_lock_irq(&m=
hi_chan->lock);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1305  		mhi_chan->ch_stat=
e =3D (to_state =3D=3D MHI_CH_STATE_TYPE_START) ?
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1306  				      MHI_CH_ST=
ATE_ENABLED : MHI_CH_STATE_STOP;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1307  		write_unlock_irq(=
&mhi_chan->lock);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1308  	}
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1309  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1310  	dev_dbg(dev, "Chan=
nel %s(%d) state change to %s successful\n",
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1311  		mhi_chan->name, m=
hi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1312  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1313  exit_command_failur=
e:
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1314  	mhi_cntrl->runtime=
_put(mhi_cntrl);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1315  	mhi_device_put(mhi=
_cntrl->mhi_dev);
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1316  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1317  	return ret;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1318  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1319  exit_invalid_state:
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1320  	dev_err(dev, "Chan=
nel %s(%d) update to %s not allowed\n",
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1321  		mhi_chan->name, m=
hi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1322  =

8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1323  	return -EINVAL;
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1324  }
8f761dc8a4ccb30 Bhaumik Bhatt         2020-11-11  1325  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6895867004029336766==--

