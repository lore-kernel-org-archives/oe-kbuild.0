Content-Type: multipart/mixed; boundary="===============6830738695767635949=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8710/12851] drivers/mmc/host/tmio_mmc_core.c:222:25: warning: use of uninitialized value 'sdif_mode' [CWE-457]
Date: Tue, 26 Jul 2022 10:02:56 +0800
Message-ID: <202207261019.2VDFN02M-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6830738695767635949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
mc/host/tmio_mmc_core.c:222:25: warning: use of uninitialized value 'sdif_m=
ode' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   668af1b6548837b44a2bfe65dcbae6b250adbf63
commit: 2e586f8a5b0ed4a525014a692923ac96f6647816 [8710/12851] mmc: tmio: av=
oid glitches when resetting
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: arm-randconfig-c002-20220724 (https://download.01.org/0day-ci/archi=
ve/20220726/202207261019.2VDFN02M-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D2e586f8a5b0ed4a525014a692923ac96f6647816
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2e586f8a5b0ed4a525014a692923ac96f6647816
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/mmc/host/tmio_mmc_core.c: In function 'tmio_mmc_reset':
>> drivers/mmc/host/tmio_mmc_core.c:222:25: warning: use of uninitialized v=
alue 'sdif_mode' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     222 |                         sd_ctrl_write16(host, CTL_SDIF_MODE, sdi=
f_mode);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
     'tmio_mmc_reset': events 1-3
       |
       |  182 | static void tmio_mmc_reset(struct tmio_mmc_host *host, bool=
 preserve)
       |      |             ^~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'tmio_mmc_reset'
       |  183 | {
       |  184 |         u16 card_opt, clk_ctrl, sdif_mode;
       |      |                                 ~~~~~~~~~
       |      |                                 |
       |      |                                 (2) region created on stack=
 here
       |  185 | =

       |  186 |         if (preserve) {
       |      |            ~ =

       |      |            |
       |      |            (3) following 'true' branch (when 'preserve !=3D=
 0')...
       |
     'tmio_mmc_reset': event 4
       |
       |drivers/mmc/host/tmio_mmc.h:228:29:
       |  228 |         return ioread16(host->ctl + (addr << host->bus_shif=
t));
       |      |                         ~~~~^~~~~
       |      |                             |
       |      |                             (4) ...to here
       |
     'tmio_mmc_reset': events 5-7
       |
       |drivers/mmc/host/tmio_mmc_core.c:189:20:
       |  189 |                 if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
       |      |                    ^
       |      |                    |
       |      |                    (5) following 'false' branch...
       |......
       |  194 |         sd_ctrl_write16(host, CTL_RESET_SD, 0x0000);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) ...to here
       |......
       |  204 |         sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, ho=
st->sdcard_irq_mask_all);
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (7) calling 'sd_ctrl_write32_as_16_and_16' from 'tm=
io_mmc_reset'
       |
       +--> 'sd_ctrl_write32_as_16_and_16': events 8-10
              |
              |drivers/mmc/host/tmio_mmc.h:267:20:
              |  267 | static inline void sd_ctrl_write32_as_16_and_16(stru=
ct tmio_mmc_host *host,
              |      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                    |
              |      |                    (8) entry to 'sd_ctrl_write32_as_=
16_and_16'
              |......
              |  270 |         if (addr =3D=3D CTL_IRQ_MASK || addr =3D=3D =
CTL_STATUS)
              |      |            ~        =

              |      |            |
              |      |            (9) following 'true' branch...
              |  271 |                 val |=3D host->sdcard_irq_setbit_mas=
k;
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                            |
              |      |                            (10) ...to here
              |
       <------+
       |
     'tmio_mmc_reset': events 11-16
       |
       |drivers/mmc/host/tmio_mmc_core.c:204:9:
       |  204 |         sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, ho=
st->sdcard_irq_mask_all);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (11) returning to 'tmio_mmc_reset' from 'sd_ctrl_wr=
ite32_as_16_and_16'
       |......
       |  218 |         if (preserve) {
       |      |            ~
       |      |            |
       |      |            (12) following 'true' branch (when 'preserve !=
=3D 0')...
       |  219 |                 sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, =
card_opt);
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
       |      |                 |
       |      |                 (13) ...to here
       |  220 |                 sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, =
clk_ctrl);
       |  221 |                 if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
       |      |                    ~
       |      |                    |
       |      |                    (14) following 'true' branch...
       |  222 |                         sd_ctrl_write16(host, CTL_SDIF_MODE=
, sdif_mode);
       |      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
       |      |                         |
       |      |                         (15) ...to here
       |      |                         (16) use of uninitialized value 'sd=
if_mode' here
       |
>> drivers/mmc/host/tmio_mmc_core.c:222:25: warning: use of uninitialized v=
alue 'sdif_mode' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     222 |                         sd_ctrl_write16(host, CTL_SDIF_MODE, sdi=
f_mode);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
     'tmio_mmc_reset_work': event 1
       |
       |  229 | static void tmio_mmc_reset_work(struct work_struct *work)
       |      |             ^~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'tmio_mmc_reset_work'
       |
     'tmio_mmc_reset_work': event 2
       |
       |include/linux/err.h:41:31:
       |   41 |         return unlikely(!ptr) || IS_ERR_VALUE((unsigned lon=
g)ptr);
       |
     'tmio_mmc_reset_work': event 3
       |
       |include/linux/typecheck.h:11:19:
       |   11 |         typeof(x) __dummy2; \
       |      |                   ^~~~~~~~
       |      |                   |
       |      |                   (3) ...to here
   include/linux/jiffies.h:106:10: note: in expansion of macro 'typecheck'
       |  106 |          typecheck(unsigned long, b) && \
       |      |          ^~~~~~~~~
   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
       |  108 | #define time_before(a,b)        time_after(b,a)
       |      |                                 ^~~~~~~~~~
   include/linux/jiffies.h:158:34: note: in expansion of macro 'time_before'
       |  158 | #define time_is_after_jiffies(a) time_before(jiffies, a)
       |      |                                  ^~~~~~~~~~~
   drivers/mmc/host/tmio_mmc_core.c:245:13: note: in expansion of macro 'ti=
me_is_after_jiffies'
       |  245 |             time_is_after_jiffies(host->last_req_ts +
       |      |             ^~~~~~~~~~~~~~~~~~~~~
       |
     'tmio_mmc_reset_work': event 4
       |
       |include/linux/jiffies.h:106:38:
       |  105 |         (typecheck(unsigned long, a) && \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  106 |          typecheck(unsigned long, b) && \
       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
       |      |                                      |
       |      |                                      (4) following 'false' =
branch...
       |  107 |          ((long)((b) - (a)) < 0))
       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~     =

   include/linux/jiffies.h:108:33: note: in expansion of macro 'time_after'
       |  108 | #define time_before(a,b)        time_after(b,a)
       |      |                                 ^~~~~~~~~~
   include/linux/jiffies.h:158:34: note: in expansion of macro 'time_before'
       |  158 | #define time_is_after_jiffies@ time_before(jiffies, a)
       |      |                                  ^~~~~~~~~~~
   drivers/mmc/host/tmio_mmc_core.c:245:13: note: in expansion of macro 'ti=
me_is_after_jiffies'
       |  245 |             time_is_after_jiffies(host->last_req_ts +
       |      |             ^~~~~~~~~~~~~~~~~~~~~
       |
     'tmio_mmc_reset_work': event 5
       |
       |  251 |         dev_warn(&host->pdev->dev,
       |      |                   ~~~~^~~~~~
       |      |                       |
       |      |                       (5) ...to here
   include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_pri=
ntk_index_wrap'
       |  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);          =
             \
       |      |                         ^~~
   drivers/mmc/host/tmio_mmc_core.c:251:9: note: in expansion of macro 'dev=
_warn'
       |  251 |         dev_warn(&host->pdev->dev,
       |      |         ^~~~~~~~
       |
     'tmio_mmc_reset_work': event 6
       |
       |  267 |         tmio_mmc_reset(host, true);
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |         |
       |      |         (6) calling 'tmio_mmc_reset' from 'tmio_mmc_reset_w=
ork'
       |
       +--> 'tmio_mmc_reset': events 7-9
              |
              |  182 | static void tmio_mmc_reset(struct tmio_mmc_host *hos=
t, bool preserve)
              |      |             ^~~~~~~~~~~~~~
              |      |             |
              |      |             (7) entry to 'tmio_mmc_reset'
              |  183 | {
              |  184 |         u16 card_opt, clk_ctrl, sdif_mode;
              |      |                                 ~~~~~~~~~
              |      |                                 |
              |      |                                 (8) region created o=
n stack here
              |  185 | =

              |  186 |         if (preserve) {
              |      |            ~ =

              |      |            |
              |      |            (9) following 'true' branch (when 'preser=
ve !=3D 0')...
              |
            'tmio_mmc_reset': event 10
              |
              |drivers/mmc/host/tmio_mmc.h:228:29:
              |  228 |         return ioread16(host->ctl + (addr << host->b=
us_shift));
              |      |                         ~~~~^~~~~
              |      |                             |
              |      |                             (10) ...to here
              |

vim +/sdif_mode +222 drivers/mmc/host/tmio_mmc_core.c

0a446288aa9f28a drivers/mmc/host/tmio_mmc_core.c Takeshi Saito         2021=
-03-16  181  =

2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  182  static void tmio_mmc_reset(struct tmio_mmc_host *host, bool pr=
eserve)
b6147490e6aac82 drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2011=
-03-23  183  {
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  184  	u16 card_opt, clk_ctrl, sdif_mode;
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  185  =

2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  186  	if (preserve) {
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  187  		card_opt =3D sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  188  		clk_ctrl =3D sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL);
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  189  		if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  190  			sdif_mode =3D sd_ctrl_read16(host, CTL_SDIF_MODE);
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  191  	}
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  192  =

b6147490e6aac82 drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2011=
-03-23  193  	/* FIXME - should we set stop clock reg here */
b6147490e6aac82 drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2011=
-03-23  194  	sd_ctrl_write16(host, CTL_RESET_SD, 0x0000);
1f27ddf0b50b45e drivers/mmc/host/tmio_mmc_core.c Masaharu Hayakawa     2017=
-11-03  195  	usleep_range(10000, 11000);
b6147490e6aac82 drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2011=
-03-23  196  	sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
1f27ddf0b50b45e drivers/mmc/host/tmio_mmc_core.c Masaharu Hayakawa     2017=
-11-03  197  	usleep_range(10000, 11000);
86beb538fa5f9bf drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2017=
-05-23  198  =

ab0cdefec052825 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-03-17  199  	tmio_mmc_abort_dma(host);
ab0cdefec052825 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-03-17  200  =

576146ea4ed986f drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2020=
-08-20  201  	if (host->reset)
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  202  		host->reset(host, preserve);
576146ea4ed986f drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2020=
-08-20  203  =

0751d56ef1f25c4 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-04-13  204  	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard=
_irq_mask_all);
0751d56ef1f25c4 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-04-13  205  	host->sdcard_irq_mask =3D host->sdcard_irq_mask_all;
0751d56ef1f25c4 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-04-13  206  =

90935eb303e0d12 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-10-28  207  	if (host->native_hotplug)
90935eb303e0d12 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-10-28  208  		tmio_mmc_enable_mmc_irqs(host,
90935eb303e0d12 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-10-28  209  				TMIO_STAT_CARD_REMOVE | TMIO_STAT_CARD_INSERT);
90935eb303e0d12 drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-10-28  210  =

0a446288aa9f28a drivers/mmc/host/tmio_mmc_core.c Takeshi Saito         2021=
-03-16  211  	tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
0a446288aa9f28a drivers/mmc/host/tmio_mmc_core.c Takeshi Saito         2021=
-03-16  212  =

86beb538fa5f9bf drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2017=
-05-23  213  	if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
86beb538fa5f9bf drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2017=
-05-23  214  		sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask=
);
86beb538fa5f9bf drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2017=
-05-23  215  		sd_ctrl_write16(host, CTL_TRANSACTION_CTL, 0x0001);
86beb538fa5f9bf drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2017=
-05-23  216  	}
6e5c951b4c3a0bd drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-03-16  217  =

2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  218  	if (preserve) {
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  219  		sd_ctrl_write16(host, CTL_SD_MEM_CARD_OPT, card_opt);
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  220  		sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clk_ctrl);
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  221  		if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25 @222  			sd_ctrl_write16(host, CTL_SDIF_MODE, sdif_mode);
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  223  	}
2e586f8a5b0ed4a drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2022=
-06-25  224  =

6e5c951b4c3a0bd drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-03-16  225  	if (host->mmc->card)
6e5c951b4c3a0bd drivers/mmc/host/tmio_mmc_core.c Wolfram Sang          2021=
-03-16  226  		mmc_retune_needed(host->mmc);
b6147490e6aac82 drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2011=
-03-23  227  }
b6147490e6aac82 drivers/mmc/host/tmio_mmc_pio.c  Guennadi Liakhovetski 2011=
-03-23  228  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6830738695767635949==--

