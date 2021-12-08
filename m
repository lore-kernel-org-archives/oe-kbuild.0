Content-Type: multipart/mixed; boundary="===============6278648077448549822=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5 2/5] iio: sx9310: Extract common Semtech sensor logic
Date: Wed, 08 Dec 2021 21:50:01 +0800
Message-ID: <202112082153.z59OZK8i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6278648077448549822==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211208004311.3098571-3-gwendal@chromium.org>
References: <20211208004311.3098571-3-gwendal@chromium.org>
TO: Gwendal Grignou <gwendal@chromium.org>
TO: jic23(a)kernel.org
TO: lars(a)metafoo.de
TO: swboyd(a)chromium.org
CC: andy.shevchenko(a)gmail.com
CC: linux-iio(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: Gwendal Grignou <gwendal@chromium.org>

Hi Gwendal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gwendal-Grignou/Expand-Sem=
tech-SAR-Sensors-support/20211208-084635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: i386-randconfig-m021-20211207 (https://download.01.org/0day-ci/arch=
ive/20211208/202112082153.z59OZK8i-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iio/proximity/sx_common.c:216 sx_common_read_proximity() error: uni=
nitialized symbol 'rawval'.
drivers/iio/proximity/sx_common.c:385 sx_common_trigger_handler() error: un=
initialized symbol 'val'.

vim +/rawval +216 drivers/iio/proximity/sx_common.c

0b731cf079e510 Gwendal Grignou 2021-12-07  171  =

0b731cf079e510 Gwendal Grignou 2021-12-07  172  /**
0b731cf079e510 Gwendal Grignou 2021-12-07  173   * sx_common_read_proximity=
() - Read raw proximity value.
0b731cf079e510 Gwendal Grignou 2021-12-07  174   *
0b731cf079e510 Gwendal Grignou 2021-12-07  175   * @data:	Internal data
0b731cf079e510 Gwendal Grignou 2021-12-07  176   * @chan:	Channel to read
0b731cf079e510 Gwendal Grignou 2021-12-07  177   * @val:	pointer to return =
read value.
0b731cf079e510 Gwendal Grignou 2021-12-07  178   *
0b731cf079e510 Gwendal Grignou 2021-12-07  179   * Request a conversion, wa=
it for the sensor to be ready and
0b731cf079e510 Gwendal Grignou 2021-12-07  180   * return the raw proximity=
 value.
0b731cf079e510 Gwendal Grignou 2021-12-07  181   */
0b731cf079e510 Gwendal Grignou 2021-12-07  182  int sx_common_read_proximit=
y(struct sx_common_data *data,
0b731cf079e510 Gwendal Grignou 2021-12-07  183  			     const struct iio_ch=
an_spec *chan, int *val)
0b731cf079e510 Gwendal Grignou 2021-12-07  184  {
0b731cf079e510 Gwendal Grignou 2021-12-07  185  	int ret;
0b731cf079e510 Gwendal Grignou 2021-12-07  186  	__be16 rawval;
0b731cf079e510 Gwendal Grignou 2021-12-07  187  =

0b731cf079e510 Gwendal Grignou 2021-12-07  188  	mutex_lock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  189  =

0b731cf079e510 Gwendal Grignou 2021-12-07  190  	ret =3D sx_common_get_read=
_channel(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  191  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  192  		goto out;
0b731cf079e510 Gwendal Grignou 2021-12-07  193  =

0b731cf079e510 Gwendal Grignou 2021-12-07  194  	ret =3D sx_common_enable_i=
rq(data, SX_COMMON_CONVDONE_IRQ);
0b731cf079e510 Gwendal Grignou 2021-12-07  195  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  196  		goto out_put_channel;
0b731cf079e510 Gwendal Grignou 2021-12-07  197  =

0b731cf079e510 Gwendal Grignou 2021-12-07  198  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  199  =

0b731cf079e510 Gwendal Grignou 2021-12-07  200  	if (data->client->irq) {
0b731cf079e510 Gwendal Grignou 2021-12-07  201  		ret =3D wait_for_completi=
on_interruptible(&data->completion);
0b731cf079e510 Gwendal Grignou 2021-12-07  202  		reinit_completion(&data->=
completion);
0b731cf079e510 Gwendal Grignou 2021-12-07  203  	} else {
0b731cf079e510 Gwendal Grignou 2021-12-07  204  		ret =3D data->chip_info->=
ops.wait_for_sample(data);
0b731cf079e510 Gwendal Grignou 2021-12-07  205  	}
0b731cf079e510 Gwendal Grignou 2021-12-07  206  =

0b731cf079e510 Gwendal Grignou 2021-12-07  207  	mutex_lock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  208  =

0b731cf079e510 Gwendal Grignou 2021-12-07  209  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  210  		goto out_disable_irq;
0b731cf079e510 Gwendal Grignou 2021-12-07  211  =

0b731cf079e510 Gwendal Grignou 2021-12-07  212  	ret =3D data->chip_info->o=
ps.read_prox_data(data, chan, &rawval);
0b731cf079e510 Gwendal Grignou 2021-12-07  213  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  214  		goto out_disable_irq;
0b731cf079e510 Gwendal Grignou 2021-12-07  215  =

0b731cf079e510 Gwendal Grignou 2021-12-07 @216  	*val =3D sign_extend32(be1=
6_to_cpu(rawval), chan->scan_type.realbits - 1);
0b731cf079e510 Gwendal Grignou 2021-12-07  217  =

0b731cf079e510 Gwendal Grignou 2021-12-07  218  	ret =3D sx_common_disable_=
irq(data, SX_COMMON_CONVDONE_IRQ);
0b731cf079e510 Gwendal Grignou 2021-12-07  219  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  220  		goto out_put_channel;
0b731cf079e510 Gwendal Grignou 2021-12-07  221  =

0b731cf079e510 Gwendal Grignou 2021-12-07  222  	ret =3D sx_common_put_read=
_channel(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  223  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  224  		goto out;
0b731cf079e510 Gwendal Grignou 2021-12-07  225  =

0b731cf079e510 Gwendal Grignou 2021-12-07  226  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  227  =

0b731cf079e510 Gwendal Grignou 2021-12-07  228  	return IIO_VAL_INT;
0b731cf079e510 Gwendal Grignou 2021-12-07  229  =

0b731cf079e510 Gwendal Grignou 2021-12-07  230  out_disable_irq:
0b731cf079e510 Gwendal Grignou 2021-12-07  231  	sx_common_disable_irq(data=
, SX_COMMON_CONVDONE_IRQ);
0b731cf079e510 Gwendal Grignou 2021-12-07  232  out_put_channel:
0b731cf079e510 Gwendal Grignou 2021-12-07  233  	sx_common_put_read_channel=
(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  234  out:
0b731cf079e510 Gwendal Grignou 2021-12-07  235  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  236  =

0b731cf079e510 Gwendal Grignou 2021-12-07  237  	return ret;
0b731cf079e510 Gwendal Grignou 2021-12-07  238  }
0b731cf079e510 Gwendal Grignou 2021-12-07  239  EXPORT_SYMBOL_GPL(sx_common=
_read_proximity);
0b731cf079e510 Gwendal Grignou 2021-12-07  240  =

0b731cf079e510 Gwendal Grignou 2021-12-07  241  /**
0b731cf079e510 Gwendal Grignou 2021-12-07  242   * sx_common_read_event_con=
fig() - Configure event setting.
0b731cf079e510 Gwendal Grignou 2021-12-07  243   *
0b731cf079e510 Gwendal Grignou 2021-12-07  244   * @indio_dev:	iio device o=
bject
0b731cf079e510 Gwendal Grignou 2021-12-07  245   * @chan:	Channel to read
0b731cf079e510 Gwendal Grignou 2021-12-07  246   * @type:	Type of event (un=
used)
0b731cf079e510 Gwendal Grignou 2021-12-07  247   * @dir:	Direction of event=
 (unused)
0b731cf079e510 Gwendal Grignou 2021-12-07  248   *
0b731cf079e510 Gwendal Grignou 2021-12-07  249   * return if the given chan=
nel is used for event gathering.
0b731cf079e510 Gwendal Grignou 2021-12-07  250   */
0b731cf079e510 Gwendal Grignou 2021-12-07  251  int sx_common_read_event_co=
nfig(struct iio_dev *indio_dev,
0b731cf079e510 Gwendal Grignou 2021-12-07  252  				const struct iio_chan_s=
pec *chan,
0b731cf079e510 Gwendal Grignou 2021-12-07  253  				enum iio_event_type typ=
e,
0b731cf079e510 Gwendal Grignou 2021-12-07  254  				enum iio_event_directio=
n dir)
0b731cf079e510 Gwendal Grignou 2021-12-07  255  {
0b731cf079e510 Gwendal Grignou 2021-12-07  256  	struct sx_common_data *dat=
a =3D iio_priv(indio_dev);
0b731cf079e510 Gwendal Grignou 2021-12-07  257  =

0b731cf079e510 Gwendal Grignou 2021-12-07  258  	return !!(data->chan_event=
 & BIT(chan->channel));
0b731cf079e510 Gwendal Grignou 2021-12-07  259  }
0b731cf079e510 Gwendal Grignou 2021-12-07  260  EXPORT_SYMBOL_GPL(sx_common=
_read_event_config);
0b731cf079e510 Gwendal Grignou 2021-12-07  261  =

0b731cf079e510 Gwendal Grignou 2021-12-07  262  /**
0b731cf079e510 Gwendal Grignou 2021-12-07  263   * sx_common_write_event_co=
nfig() - Configure event setting.
0b731cf079e510 Gwendal Grignou 2021-12-07  264   *
0b731cf079e510 Gwendal Grignou 2021-12-07  265   * @indio_dev:	iio device o=
bject
0b731cf079e510 Gwendal Grignou 2021-12-07  266   * @chan:	Channel to enable
0b731cf079e510 Gwendal Grignou 2021-12-07  267   * @type:	Type of event (un=
used)
0b731cf079e510 Gwendal Grignou 2021-12-07  268   * @dir:	Direction of event=
 (unused)
0b731cf079e510 Gwendal Grignou 2021-12-07  269   * @state:	State of the eve=
nt.
0b731cf079e510 Gwendal Grignou 2021-12-07  270   *
0b731cf079e510 Gwendal Grignou 2021-12-07  271   * Enable/Disable event on =
a given channel.
0b731cf079e510 Gwendal Grignou 2021-12-07  272   */
0b731cf079e510 Gwendal Grignou 2021-12-07  273  int sx_common_write_event_c=
onfig(struct iio_dev *indio_dev,
0b731cf079e510 Gwendal Grignou 2021-12-07  274  				 const struct iio_chan_=
spec *chan,
0b731cf079e510 Gwendal Grignou 2021-12-07  275  				 enum iio_event_type ty=
pe,
0b731cf079e510 Gwendal Grignou 2021-12-07  276  				 enum iio_event_directi=
on dir, int state)
0b731cf079e510 Gwendal Grignou 2021-12-07  277  {
0b731cf079e510 Gwendal Grignou 2021-12-07  278  	struct sx_common_data *dat=
a =3D iio_priv(indio_dev);
0b731cf079e510 Gwendal Grignou 2021-12-07  279  	unsigned int eventirq =3D =
SX_COMMON_FAR_IRQ | SX_COMMON_CLOSE_IRQ;
0b731cf079e510 Gwendal Grignou 2021-12-07  280  	int ret;
0b731cf079e510 Gwendal Grignou 2021-12-07  281  =

0b731cf079e510 Gwendal Grignou 2021-12-07  282  	/* If the state hasn't cha=
nged, there's nothing to do. */
0b731cf079e510 Gwendal Grignou 2021-12-07  283  	if (!!(data->chan_event & =
BIT(chan->channel)) =3D=3D state)
0b731cf079e510 Gwendal Grignou 2021-12-07  284  		return 0;
0b731cf079e510 Gwendal Grignou 2021-12-07  285  =

0b731cf079e510 Gwendal Grignou 2021-12-07  286  	mutex_lock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  287  	if (state) {
0b731cf079e510 Gwendal Grignou 2021-12-07  288  		ret =3D sx_common_get_eve=
nt_channel(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  289  		if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  290  			goto out_unlock;
0b731cf079e510 Gwendal Grignou 2021-12-07  291  		if (!(data->chan_event & =
~BIT(chan->channel))) {
0b731cf079e510 Gwendal Grignou 2021-12-07  292  			ret =3D sx_common_enable=
_irq(data, eventirq);
0b731cf079e510 Gwendal Grignou 2021-12-07  293  			if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  294  				sx_common_put_event_cha=
nnel(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  295  		}
0b731cf079e510 Gwendal Grignou 2021-12-07  296  	} else {
0b731cf079e510 Gwendal Grignou 2021-12-07  297  		ret =3D sx_common_put_eve=
nt_channel(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  298  		if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  299  			goto out_unlock;
0b731cf079e510 Gwendal Grignou 2021-12-07  300  		if (!data->chan_event) {
0b731cf079e510 Gwendal Grignou 2021-12-07  301  			ret =3D sx_common_disabl=
e_irq(data, eventirq);
0b731cf079e510 Gwendal Grignou 2021-12-07  302  			if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  303  				sx_common_get_event_cha=
nnel(data, chan->channel);
0b731cf079e510 Gwendal Grignou 2021-12-07  304  		}
0b731cf079e510 Gwendal Grignou 2021-12-07  305  	}
0b731cf079e510 Gwendal Grignou 2021-12-07  306  =

0b731cf079e510 Gwendal Grignou 2021-12-07  307  out_unlock:
0b731cf079e510 Gwendal Grignou 2021-12-07  308  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  309  	return ret;
0b731cf079e510 Gwendal Grignou 2021-12-07  310  }
0b731cf079e510 Gwendal Grignou 2021-12-07  311  EXPORT_SYMBOL_GPL(sx_common=
_write_event_config);
0b731cf079e510 Gwendal Grignou 2021-12-07  312  =

0b731cf079e510 Gwendal Grignou 2021-12-07  313  static int sx_common_set_tr=
igger_state(struct iio_trigger *trig, bool state)
0b731cf079e510 Gwendal Grignou 2021-12-07  314  {
0b731cf079e510 Gwendal Grignou 2021-12-07  315  	struct iio_dev *indio_dev =
=3D iio_trigger_get_drvdata(trig);
0b731cf079e510 Gwendal Grignou 2021-12-07  316  	struct sx_common_data *dat=
a =3D iio_priv(indio_dev);
0b731cf079e510 Gwendal Grignou 2021-12-07  317  	int ret =3D 0;
0b731cf079e510 Gwendal Grignou 2021-12-07  318  =

0b731cf079e510 Gwendal Grignou 2021-12-07  319  	mutex_lock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  320  =

0b731cf079e510 Gwendal Grignou 2021-12-07  321  	if (state)
0b731cf079e510 Gwendal Grignou 2021-12-07  322  		ret =3D sx_common_enable_=
irq(data, SX_COMMON_CONVDONE_IRQ);
0b731cf079e510 Gwendal Grignou 2021-12-07  323  	else if (!data->chan_read)
0b731cf079e510 Gwendal Grignou 2021-12-07  324  		ret =3D sx_common_disable=
_irq(data, SX_COMMON_CONVDONE_IRQ);
0b731cf079e510 Gwendal Grignou 2021-12-07  325  	if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  326  		goto out;
0b731cf079e510 Gwendal Grignou 2021-12-07  327  =

0b731cf079e510 Gwendal Grignou 2021-12-07  328  	data->trigger_enabled =3D =
state;
0b731cf079e510 Gwendal Grignou 2021-12-07  329  =

0b731cf079e510 Gwendal Grignou 2021-12-07  330  out:
0b731cf079e510 Gwendal Grignou 2021-12-07  331  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  332  =

0b731cf079e510 Gwendal Grignou 2021-12-07  333  	return ret;
0b731cf079e510 Gwendal Grignou 2021-12-07  334  }
0b731cf079e510 Gwendal Grignou 2021-12-07  335  =

0b731cf079e510 Gwendal Grignou 2021-12-07  336  static const struct iio_tri=
gger_ops sx_common_trigger_ops =3D {
0b731cf079e510 Gwendal Grignou 2021-12-07  337  	.set_trigger_state =3D sx_=
common_set_trigger_state,
0b731cf079e510 Gwendal Grignou 2021-12-07  338  };
0b731cf079e510 Gwendal Grignou 2021-12-07  339  =

0b731cf079e510 Gwendal Grignou 2021-12-07  340  static irqreturn_t sx_commo=
n_irq_thread_handler(int irq, void *private)
0b731cf079e510 Gwendal Grignou 2021-12-07  341  {
0b731cf079e510 Gwendal Grignou 2021-12-07  342  	struct iio_dev *indio_dev =
=3D private;
0b731cf079e510 Gwendal Grignou 2021-12-07  343  	struct sx_common_data *dat=
a =3D iio_priv(indio_dev);
0b731cf079e510 Gwendal Grignou 2021-12-07  344  	int ret;
0b731cf079e510 Gwendal Grignou 2021-12-07  345  	unsigned int val;
0b731cf079e510 Gwendal Grignou 2021-12-07  346  =

0b731cf079e510 Gwendal Grignou 2021-12-07  347  	mutex_lock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  348  =

0b731cf079e510 Gwendal Grignou 2021-12-07  349  	ret =3D regmap_read(data->=
regmap, SX_COMMON_REG_IRQ_SRC, &val);
0b731cf079e510 Gwendal Grignou 2021-12-07  350  	if (ret) {
0b731cf079e510 Gwendal Grignou 2021-12-07  351  		dev_err(&data->client->de=
v, "i2c transfer error in irq\n");
0b731cf079e510 Gwendal Grignou 2021-12-07  352  		goto out;
0b731cf079e510 Gwendal Grignou 2021-12-07  353  	}
0b731cf079e510 Gwendal Grignou 2021-12-07  354  =

0b731cf079e510 Gwendal Grignou 2021-12-07  355  	if (val & ((SX_COMMON_FAR_=
IRQ | SX_COMMON_CLOSE_IRQ) << data->chip_info->irq_msk_offset))
0b731cf079e510 Gwendal Grignou 2021-12-07  356  		sx_common_push_events(ind=
io_dev);
0b731cf079e510 Gwendal Grignou 2021-12-07  357  =

0b731cf079e510 Gwendal Grignou 2021-12-07  358  	if (val & (SX_COMMON_CONVD=
ONE_IRQ << data->chip_info->irq_msk_offset))
0b731cf079e510 Gwendal Grignou 2021-12-07  359  		complete(&data->completio=
n);
0b731cf079e510 Gwendal Grignou 2021-12-07  360  =

0b731cf079e510 Gwendal Grignou 2021-12-07  361  out:
0b731cf079e510 Gwendal Grignou 2021-12-07  362  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  363  =

0b731cf079e510 Gwendal Grignou 2021-12-07  364  	return IRQ_HANDLED;
0b731cf079e510 Gwendal Grignou 2021-12-07  365  }
0b731cf079e510 Gwendal Grignou 2021-12-07  366  =

0b731cf079e510 Gwendal Grignou 2021-12-07  367  static irqreturn_t sx_commo=
n_trigger_handler(int irq, void *private)
0b731cf079e510 Gwendal Grignou 2021-12-07  368  {
0b731cf079e510 Gwendal Grignou 2021-12-07  369  	struct iio_poll_func *pf =
=3D private;
0b731cf079e510 Gwendal Grignou 2021-12-07  370  	struct iio_dev *indio_dev =
=3D pf->indio_dev;
0b731cf079e510 Gwendal Grignou 2021-12-07  371  	struct sx_common_data *dat=
a =3D iio_priv(indio_dev);
0b731cf079e510 Gwendal Grignou 2021-12-07  372  	__be16 val;
0b731cf079e510 Gwendal Grignou 2021-12-07  373  	int bit, ret, i =3D 0;
0b731cf079e510 Gwendal Grignou 2021-12-07  374  =

0b731cf079e510 Gwendal Grignou 2021-12-07  375  	mutex_lock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  376  =

0b731cf079e510 Gwendal Grignou 2021-12-07  377  	for_each_set_bit(bit, indi=
o_dev->active_scan_mask,
0b731cf079e510 Gwendal Grignou 2021-12-07  378  			 indio_dev->masklength) {
0b731cf079e510 Gwendal Grignou 2021-12-07  379  		ret =3D data->chip_info->=
ops.read_prox_data(data,
0b731cf079e510 Gwendal Grignou 2021-12-07  380  						     &indio_dev->chan=
nels[bit],
0b731cf079e510 Gwendal Grignou 2021-12-07  381  						     &val);
0b731cf079e510 Gwendal Grignou 2021-12-07  382  		if (ret)
0b731cf079e510 Gwendal Grignou 2021-12-07  383  			goto out;
0b731cf079e510 Gwendal Grignou 2021-12-07  384  =

0b731cf079e510 Gwendal Grignou 2021-12-07 @385  		data->buffer.channels[i++=
] =3D val;
0b731cf079e510 Gwendal Grignou 2021-12-07  386  	}
0b731cf079e510 Gwendal Grignou 2021-12-07  387  =

0b731cf079e510 Gwendal Grignou 2021-12-07  388  	iio_push_to_buffers_with_t=
imestamp(indio_dev, &data->buffer,
0b731cf079e510 Gwendal Grignou 2021-12-07  389  					   pf->timestamp);
0b731cf079e510 Gwendal Grignou 2021-12-07  390  =

0b731cf079e510 Gwendal Grignou 2021-12-07  391  out:
0b731cf079e510 Gwendal Grignou 2021-12-07  392  	mutex_unlock(&data->mutex);
0b731cf079e510 Gwendal Grignou 2021-12-07  393  =

0b731cf079e510 Gwendal Grignou 2021-12-07  394  	iio_trigger_notify_done(in=
dio_dev->trig);
0b731cf079e510 Gwendal Grignou 2021-12-07  395  =

0b731cf079e510 Gwendal Grignou 2021-12-07  396  	return IRQ_HANDLED;
0b731cf079e510 Gwendal Grignou 2021-12-07  397  }
0b731cf079e510 Gwendal Grignou 2021-12-07  398  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6278648077448549822==--

