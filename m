Content-Type: multipart/mixed; boundary="===============1669974039701532923=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 3/9] bus: mhi: core: Improvements to the channel handling state machine
Date: Sat, 09 Jan 2021 15:38:47 +0800
Message-ID: <202101091533.74PLqrQH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1669974039701532923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1610139297-36435-4-git-send-email-bbhatt@codeaurora.org>
References: <1610139297-36435-4-git-send-email-bbhatt@codeaurora.org>
TO: Bhaumik Bhatt <bbhatt@codeaurora.org>
TO: manivannan.sadhasivam(a)linaro.org
CC: linux-arm-msm(a)vger.kernel.org
CC: hemantk(a)codeaurora.org
CC: jhugo(a)codeaurora.org
CC: linux-kernel(a)vger.kernel.org
CC: loic.poulain(a)linaro.org
CC: Bhaumik Bhatt <bbhatt@codeaurora.org>

Hi Bhaumik,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.11-rc2 next-20210108]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bhaumik-Bhatt/Updates-to-M=
HI-channel-handling/20210109-050206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
f5e6c330254ae691f6d7befe61c786eb5056007e
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/bus/mhi/core/main.c:1276:6: warning: Variable 'ret' is reassigne=
d a value before the old one has been used. 'break;' missing? [redundantAss=
ignInSwitch]
    ret =3D mhi_device_get_sync(mhi_cntrl->mhi_dev);
        ^
   drivers/bus/mhi/core/main.c:1239:0: note: Variable 'ret' is reassigned a=
 value before the old one has been used. 'break;' missing?
    int ret =3D -EIO;
   ^
   drivers/bus/mhi/core/main.c:1276:6: note: Variable 'ret' is reassigned a=
 value before the old one has been used. 'break;' missing?
    ret =3D mhi_device_get_sync(mhi_cntrl->mhi_dev);
        ^

vim +1276 drivers/bus/mhi/core/main.c

189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1232  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1233  static int mhi_upda=
te_channel_state(struct mhi_controller *mhi_cntrl,
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1234  				    struct mhi_=
chan *mhi_chan,
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1235  				    enum mhi_ch=
_state_type to_state)
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1236  {
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1237  	struct device *dev=
 =3D &mhi_cntrl->mhi_dev->dev;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1238  	enum mhi_cmd_type =
cmd =3D MHI_CMD_NOP;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1239  	int ret =3D -EIO;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1240  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1241  	dev_dbg(dev, "Upda=
ting channel %s(%d) state to: %s\n", mhi_chan->name,
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1242  		mhi_chan->chan, T=
O_CH_STATE_TYPE_STR(to_state));
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1243  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1244  	switch (to_state) {
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1245  	case MHI_CH_STATE_=
TYPE_RESET:
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1246  		write_lock_irq(&m=
hi_chan->lock);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1247  		if (mhi_chan->ch_=
state !=3D MHI_CH_STATE_STOP &&
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1248  		    mhi_chan->ch_=
state !=3D MHI_CH_STATE_ENABLED &&
a7f422f2f89e7d4 Loic Poulain          2020-10-09  1249  		    mhi_chan->ch_=
state !=3D MHI_CH_STATE_SUSPENDED) {
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1250  			write_unlock_irq=
(&mhi_chan->lock);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1251  			goto exit_invali=
d_state;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1252  		}
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1253  		mhi_chan->ch_stat=
e =3D MHI_CH_STATE_DISABLED;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1254  		write_unlock_irq(=
&mhi_chan->lock);
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1255  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1256  		cmd =3D MHI_CMD_R=
ESET_CHAN;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1257  		break;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1258  	case MHI_CH_STATE_=
TYPE_STOP:
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1259  		if (mhi_chan->ch_=
state !=3D MHI_CH_STATE_ENABLED)
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1260  			goto exit_invali=
d_state;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1261  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1262  		cmd =3D MHI_CMD_S=
TOP_CHAN;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1263  		break;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1264  	case MHI_CH_STATE_=
TYPE_START:
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1265  		if (mhi_chan->ch_=
state !=3D MHI_CH_STATE_STOP &&
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1266  		    mhi_chan->ch_=
state !=3D MHI_CH_STATE_DISABLED)
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1267  			goto exit_invali=
d_state;
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1268  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1269  		cmd =3D MHI_CMD_S=
TART_CHAN;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1270  		break;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1271  	default:
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1272  		goto exit_invalid=
_state;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1273  	}
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1274  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1275  	/* bring host and =
device out of suspended states */
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08 @1276  	ret =3D mhi_device=
_get_sync(mhi_cntrl->mhi_dev);
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1277  	if (ret)
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1278  		return ret;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1279  	mhi_cntrl->runtime=
_get(mhi_cntrl);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1280  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1281  	reinit_completion(=
&mhi_chan->completion);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1282  	ret =3D mhi_send_c=
md(mhi_cntrl, mhi_chan, cmd);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1283  	if (ret) {
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1284  		dev_err(dev, "Fai=
led to send %s(%d) %s command\n",
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1285  			mhi_chan->name, =
mhi_chan->chan,
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1286  			TO_CH_STATE_TYPE=
_STR(to_state));
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1287  		goto exit_command=
_failure;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1288  	}
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1289  =

189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1290  	ret =3D wait_for_c=
ompletion_timeout(&mhi_chan->completion,
189ff97cca53e3f Manivannan Sadhasivam 2020-02-20  1291  				       msecs_to=
_jiffies(mhi_cntrl->timeout_ms));
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1292  	if (!ret || mhi_ch=
an->ccs !=3D MHI_EV_CC_SUCCESS) {
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1293  		dev_err(dev, "Fai=
led to receive %s(%d) %s command completion\n",
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1294  			mhi_chan->name, =
mhi_chan->chan,
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1295  			TO_CH_STATE_TYPE=
_STR(to_state));
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1296  		ret =3D -EIO;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1297  		goto exit_command=
_failure;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1298  	}
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1299  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1300  	ret =3D 0;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1301  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1302  	if (to_state !=3D =
MHI_CH_STATE_TYPE_RESET) {
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1303  		write_lock_irq(&m=
hi_chan->lock);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1304  		mhi_chan->ch_stat=
e =3D (to_state =3D=3D MHI_CH_STATE_TYPE_START) ?
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1305  				      MHI_CH_ST=
ATE_ENABLED : MHI_CH_STATE_STOP;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1306  		write_unlock_irq(=
&mhi_chan->lock);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1307  	}
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1308  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1309  	dev_dbg(dev, "Chan=
nel %s(%d) state change to %s successful\n",
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1310  		mhi_chan->name, m=
hi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1311  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1312  exit_command_failur=
e:
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1313  	mhi_cntrl->runtime=
_put(mhi_cntrl);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1314  	mhi_device_put(mhi=
_cntrl->mhi_dev);
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1315  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1316  	return ret;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1317  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1318  exit_invalid_state:
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1319  	dev_err(dev, "Chan=
nel %s(%d) update to %s not allowed\n",
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1320  		mhi_chan->name, m=
hi_chan->chan, TO_CH_STATE_TYPE_STR(to_state));
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1321  =

5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1322  	return -EINVAL;
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1323  }
5ba47e684d77e4c Bhaumik Bhatt         2021-01-08  1324  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1669974039701532923==--

