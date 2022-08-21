Content-Type: multipart/mixed; boundary="===============8362290883254705529=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v9 3/4] pwm: add microchip soft ip corePWM driver
Date: Sun, 21 Aug 2022 23:53:10 +0800
Message-ID: <202208212329.XETz1mt0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8362290883254705529==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220819085703.4161266-4-conor.dooley@microchip.com>
References: <20220819085703.4161266-4-conor.dooley@microchip.com>
TO: Conor Dooley <conor.dooley@microchip.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: "Uwe Kleine-K=C3=B6nig" <u.kleine-koenig@pengutronix.de>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-pwm(a)vger.kernel.org
CC: linux-riscv(a)lists.infradead.org
CC: Conor Dooley <conor.dooley@microchip.com>

Hi Conor,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 568035b01cfb107af8d2e4bd2fb9aea22cf5b868]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/Microch=
ip-soft-ip-corePWM-driver/20220819-170106
base:   568035b01cfb107af8d2e4bd2fb9aea22cf5b868
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-m031-20220821 (https://download.01.org/0day-ci/arc=
hive/20220821/202208212329.XETz1mt0-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/pwm/pwm-microchip-core.c:295 mchp_core_pwm_apply() warn: inconsiste=
nt returns '&mchp_core_pwm->lock'.

vim +295 drivers/pwm/pwm-microchip-core.c

ae39414af22131 Conor Dooley 2022-08-19  199  =

ae39414af22131 Conor Dooley 2022-08-19  200  static int mchp_core_pwm_apply=
(struct pwm_chip *chip, struct pwm_device *pwm,
ae39414af22131 Conor Dooley 2022-08-19  201  			       const struct pwm_sta=
te *state)
ae39414af22131 Conor Dooley 2022-08-19  202  {
ae39414af22131 Conor Dooley 2022-08-19  203  	struct mchp_core_pwm_chip *mc=
hp_core_pwm =3D to_mchp_core_pwm(chip);
ae39414af22131 Conor Dooley 2022-08-19  204  	struct pwm_state current_stat=
e =3D pwm->state;
ae39414af22131 Conor Dooley 2022-08-19  205  	bool period_locked;
ae39414af22131 Conor Dooley 2022-08-19  206  	u64 duty_steps;
ae39414af22131 Conor Dooley 2022-08-19  207  	u16 prescale;
ae39414af22131 Conor Dooley 2022-08-19  208  	u8 period_steps;
ae39414af22131 Conor Dooley 2022-08-19  209  	int ret;
ae39414af22131 Conor Dooley 2022-08-19  210  =

ae39414af22131 Conor Dooley 2022-08-19  211  	mutex_lock(&mchp_core_pwm->lo=
ck);
ae39414af22131 Conor Dooley 2022-08-19  212  =

ae39414af22131 Conor Dooley 2022-08-19  213  	if (!state->enabled) {
ae39414af22131 Conor Dooley 2022-08-19  214  		mchp_core_pwm_enable(chip, p=
wm, false, current_state.period);
ae39414af22131 Conor Dooley 2022-08-19  215  		mutex_unlock(&mchp_core_pwm-=
>lock);
ae39414af22131 Conor Dooley 2022-08-19  216  		return 0;
ae39414af22131 Conor Dooley 2022-08-19  217  	}
ae39414af22131 Conor Dooley 2022-08-19  218  =

ae39414af22131 Conor Dooley 2022-08-19  219  	/*
ae39414af22131 Conor Dooley 2022-08-19  220  	 * If the only thing that has=
 changed is the duty cycle or the polarity,
ae39414af22131 Conor Dooley 2022-08-19  221  	 * we can shortcut the calcul=
ations and just compute/apply the new duty
ae39414af22131 Conor Dooley 2022-08-19  222  	 * cycle pos & neg edges
ae39414af22131 Conor Dooley 2022-08-19  223  	 * As all the channels share =
the same period, do not allow it to be
ae39414af22131 Conor Dooley 2022-08-19  224  	 * changed if any other chann=
els are enabled.
ae39414af22131 Conor Dooley 2022-08-19  225  	 * If the period is locked, i=
t may not be possible to use a period
ae39414af22131 Conor Dooley 2022-08-19  226  	 * less than that requested. =
In that case, we just abort.
ae39414af22131 Conor Dooley 2022-08-19  227  	 */
ae39414af22131 Conor Dooley 2022-08-19  228  	period_locked =3D mchp_core_p=
wm->channel_enabled & ~(1 << pwm->hwpwm);
ae39414af22131 Conor Dooley 2022-08-19  229  =

ae39414af22131 Conor Dooley 2022-08-19  230  	if (period_locked) {
ae39414af22131 Conor Dooley 2022-08-19  231  		u16 hw_prescale;
ae39414af22131 Conor Dooley 2022-08-19  232  		u8 hw_period_steps;
ae39414af22131 Conor Dooley 2022-08-19  233  =

ae39414af22131 Conor Dooley 2022-08-19  234  		mchp_core_pwm_calc_period(ch=
ip, state, (u8 *)&prescale, &period_steps);
ae39414af22131 Conor Dooley 2022-08-19  235  		hw_prescale =3D readb_relaxe=
d(mchp_core_pwm->base + MCHPCOREPWM_PRESCALE);
ae39414af22131 Conor Dooley 2022-08-19  236  		hw_period_steps =3D readb_re=
laxed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
ae39414af22131 Conor Dooley 2022-08-19  237  =

ae39414af22131 Conor Dooley 2022-08-19  238  		if ((period_steps + 1) * (pr=
escale + 1) <
ae39414af22131 Conor Dooley 2022-08-19  239  		    (hw_period_steps + 1) * =
(hw_prescale + 1)) {
ae39414af22131 Conor Dooley 2022-08-19  240  			mutex_unlock(&mchp_core_pwm=
->lock);
ae39414af22131 Conor Dooley 2022-08-19  241  			return -EINVAL;
ae39414af22131 Conor Dooley 2022-08-19  242  		}
ae39414af22131 Conor Dooley 2022-08-19  243  =

ae39414af22131 Conor Dooley 2022-08-19  244  		/*
ae39414af22131 Conor Dooley 2022-08-19  245  		 * It is possible that somet=
hing could have set the period_steps
ae39414af22131 Conor Dooley 2022-08-19  246  		 * register to 0xff, which w=
ould prevent us from setting a 100%
ae39414af22131 Conor Dooley 2022-08-19  247  		 * duty cycle, as explained =
in the mchp_core_pwm_calc_period()
ae39414af22131 Conor Dooley 2022-08-19  248  		 * above.
ae39414af22131 Conor Dooley 2022-08-19  249  		 * The period is locked and =
we cannot change this, so we abort.
ae39414af22131 Conor Dooley 2022-08-19  250  		 */
ae39414af22131 Conor Dooley 2022-08-19  251  		if (period_steps =3D=3D MCHP=
COREPWM_PERIOD_STEPS_MAX)
ae39414af22131 Conor Dooley 2022-08-19  252  			return -EINVAL;
ae39414af22131 Conor Dooley 2022-08-19  253  =

ae39414af22131 Conor Dooley 2022-08-19  254  		prescale =3D hw_prescale;
ae39414af22131 Conor Dooley 2022-08-19  255  		period_steps =3D hw_period_s=
teps;
ae39414af22131 Conor Dooley 2022-08-19  256  	} else if (!current_state.ena=
bled || current_state.period !=3D state->period) {
ae39414af22131 Conor Dooley 2022-08-19  257  		ret =3D mchp_core_pwm_calc_p=
eriod(chip, state, (u8 *)&prescale, &period_steps);
ae39414af22131 Conor Dooley 2022-08-19  258  		if (ret) {
ae39414af22131 Conor Dooley 2022-08-19  259  			mutex_unlock(&mchp_core_pwm=
->lock);
ae39414af22131 Conor Dooley 2022-08-19  260  			return ret;
ae39414af22131 Conor Dooley 2022-08-19  261  		}
ae39414af22131 Conor Dooley 2022-08-19  262  		mchp_core_pwm_apply_period(m=
chp_core_pwm, prescale, period_steps);
ae39414af22131 Conor Dooley 2022-08-19  263  	} else {
ae39414af22131 Conor Dooley 2022-08-19  264  		prescale =3D readb_relaxed(m=
chp_core_pwm->base + MCHPCOREPWM_PRESCALE);
ae39414af22131 Conor Dooley 2022-08-19  265  		period_steps =3D readb_relax=
ed(mchp_core_pwm->base + MCHPCOREPWM_PERIOD);
ae39414af22131 Conor Dooley 2022-08-19  266  =

ae39414af22131 Conor Dooley 2022-08-19  267  		/*
ae39414af22131 Conor Dooley 2022-08-19  268  		 * As above, it is possible =
that something could have set the
ae39414af22131 Conor Dooley 2022-08-19  269  		 * period_steps register to =
0xff, which would prevent us from
ae39414af22131 Conor Dooley 2022-08-19  270  		 * setting a 100% duty cycle=
, as explained above.
ae39414af22131 Conor Dooley 2022-08-19  271  		 * As the period is not lock=
ed, we are free to fix this.
ae39414af22131 Conor Dooley 2022-08-19  272  		 */
ae39414af22131 Conor Dooley 2022-08-19  273  		if (period_steps =3D=3D MCHP=
COREPWM_PERIOD_STEPS_MAX) {
ae39414af22131 Conor Dooley 2022-08-19  274  			period_steps -=3D 1;
ae39414af22131 Conor Dooley 2022-08-19  275  			mchp_core_pwm_apply_period(=
mchp_core_pwm, prescale, period_steps);
ae39414af22131 Conor Dooley 2022-08-19  276  		}
ae39414af22131 Conor Dooley 2022-08-19  277  	}
ae39414af22131 Conor Dooley 2022-08-19  278  =

ae39414af22131 Conor Dooley 2022-08-19  279  	duty_steps =3D mchp_core_pwm_=
calc_duty(chip, pwm, state, prescale, period_steps);
ae39414af22131 Conor Dooley 2022-08-19  280  =

ae39414af22131 Conor Dooley 2022-08-19  281  	/*
ae39414af22131 Conor Dooley 2022-08-19  282  	 * Because the period is per =
channel, it is possible that the requested
ae39414af22131 Conor Dooley 2022-08-19  283  	 * duty cycle is longer than =
the period, in which case cap it to the
ae39414af22131 Conor Dooley 2022-08-19  284  	 * period, IOW a 100% duty cy=
cle.
ae39414af22131 Conor Dooley 2022-08-19  285  	 */
ae39414af22131 Conor Dooley 2022-08-19  286  	if (duty_steps > period_steps)
ae39414af22131 Conor Dooley 2022-08-19  287  		duty_steps =3D period_steps =
+ 1;
ae39414af22131 Conor Dooley 2022-08-19  288  =

ae39414af22131 Conor Dooley 2022-08-19  289  	mchp_core_pwm_apply_duty(chip=
, pwm, state, duty_steps, period_steps);
ae39414af22131 Conor Dooley 2022-08-19  290  =

ae39414af22131 Conor Dooley 2022-08-19  291  	mchp_core_pwm_enable(chip, pw=
m, true, state->period);
ae39414af22131 Conor Dooley 2022-08-19  292  =

ae39414af22131 Conor Dooley 2022-08-19  293  	mutex_unlock(&mchp_core_pwm->=
lock);
ae39414af22131 Conor Dooley 2022-08-19  294  =

ae39414af22131 Conor Dooley 2022-08-19 @295  	return 0;
ae39414af22131 Conor Dooley 2022-08-19  296  }
ae39414af22131 Conor Dooley 2022-08-19  297  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8362290883254705529==--

