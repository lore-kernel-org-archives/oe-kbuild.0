Content-Type: multipart/mixed; boundary="===============6268400385464691749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linusw-nomadik:ux500-janice-v5.17-rc1 3/7] drivers/gpu/drm/panel/panel-samsung-s6e63m0.c:755:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 09 Mar 2022 10:24:23 +0800
Message-ID: <202203091028.cIUNKuMO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6268400385464691749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-arm-kernel(a)lists.infradead.org
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadi=
k.git ux500-janice-v5.17-rc1
head:   8fa4244da48024e3d03c94bd5fc709576220825d
commit: d8fd58b542dcb1d08fee917b7d8fc03c3e797ae6 [3/7] RFC: drm/panel: s6e6=
3m0: Register ESD IRQ handler
:::::: branch date: 8 days ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220302 (https://download.01.org/0day-ci/arc=
hive/20220309/202203091028.cIUNKuMO-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-noma=
dik.git/commit/?id=3Dd8fd58b542dcb1d08fee917b7d8fc03c3e797ae6
        git remote add linusw-nomadik https://git.kernel.org/pub/scm/linux/=
kernel/git/linusw/linux-nomadik.git
        git fetch --no-tags linusw-nomadik ux500-janice-v5.17-rc1
        git checkout d8fd58b542dcb1d08fee917b7d8fc03c3e797ae6
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (7 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/video/backlight/ams369fg06.c:215:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ams369fg06_spi_write(lcd, 0x40 + i, gamma[i]);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ams369fg06.c:215:3: note: Value stored to 'ret' =
is never read
                   ret =3D ams369fg06_spi_write(lcd, 0x40 + i, gamma[i]);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ams369fg06.c:216:3: warning: Value stored to 're=
t' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D ams369fg06_spi_write(lcd, 0x50 + i, gamma[i+7*1]=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ams369fg06.c:216:3: note: Value stored to 'ret' =
is never read
                   ret =3D ams369fg06_spi_write(lcd, 0x50 + i, gamma[i+7*1]=
);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/backlight/ili922x.c:271:2: warning: Value stored to 'ret' =
is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D spi_sync(spi, &msg);
           ^     ~~~~~~~~~~~~~~~~~~~
   drivers/video/backlight/ili922x.c:271:2: note: Value stored to 'ret' is =
never read
           ret =3D spi_sync(spi, &msg);
           ^     ~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   drivers/video/backlight/lms283gf05.c:24:8: warning: Excessive padding in=
 'struct lms283gf05_seq' (2 padding bytes, where 0 is optimal). =

   Optimal fields order: =

   value, =

   reg, =

   delay, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct lms283gf05_seq {
   ~~~~~~~^~~~~~~~~~~~~~~~
   drivers/video/backlight/lms283gf05.c:24:8: note: Excessive padding in 's=
truct lms283gf05_seq' (2 padding bytes, where 0 is optimal). Optimal fields=
 order: value, reg, delay, consider reordering the fields or adding explici=
t padding members
   struct lms283gf05_seq {
   ~~~~~~~^~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/gpu/drm/panel/panel-samsung-s6e63m0.c:755:3: warning: Value stor=
ed to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
                   ret =3D devm_request_threaded_irq(dev, irq, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-samsung-s6e63m0.c:755:3: note: Value stored =
to 'ret' is never read
                   ret =3D devm_request_threaded_irq(dev, irq, NULL,
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   drivers/media/cec/core/cec-adap.c:421:3: warning: Use of memory after it=
 is freed [clang-analyzer-unix.Malloc]
                   cec_data_cancel(data, CEC_TX_STATUS_ABORTED);
                   ^
   drivers/media/cec/core/cec-adap.c:1675:6: note: Assuming field 'unregist=
ered' is false
           if (adap->devnode.unregistered)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/cec/core/cec-adap.c:1675:2: note: Taking false branch
           if (adap->devnode.unregistered)
           ^
   drivers/media/cec/core/cec-adap.c:1678:6: note: Assuming 'log_addrs' is =
null
           if (!log_addrs || log_addrs->num_log_addrs =3D=3D 0) {

vim +/ret +755 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c

d8fd58b542dcb1d Linus Walleij    2020-11-17  705  =

c2a61865baa45b5 Linus Walleij    2021-06-14  706  int s6e63m0_probe(struct =
device *dev, void *trsp,
c2a61865baa45b5 Linus Walleij    2021-06-14  707  		  int (*dcs_read)(struc=
t device *dev, void *trsp, const u8 cmd, u8 *val),
c2a61865baa45b5 Linus Walleij    2021-06-14  708  		  int (*dcs_write)(stru=
ct device *dev, void *trsp, const u8 *data, size_t len),
435e06c06cb2e3b Linus Walleij    2020-08-09  709  		  bool dsi_mode)
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  710  {
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  711  	struct s6e63m0 *ctx;
1f20bf5921de420 Linus Walleij    2020-12-14  712  	u32 max_brightness;
d8fd58b542dcb1d Linus Walleij    2020-11-17  713  	int irq;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  714  	int ret;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  715  =

994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  716  	ctx =3D devm_kzallo=
c(dev, sizeof(struct s6e63m0), GFP_KERNEL);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  717  	if (!ctx)
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  718  		return -ENOMEM;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  719  =

c2a61865baa45b5 Linus Walleij    2021-06-14  720  	ctx->transport_data =3D =
trsp;
47b1adc1d2a3b39 Linus Walleij    2020-12-05  721  	ctx->dsi_mode =3D dsi_mo=
de;
91867ac7d6724c3 Linus Walleij    2020-08-09  722  	ctx->dcs_read =3D dcs_re=
ad;
b7b23e4476872d8 Linus Walleij    2020-08-09  723  	ctx->dcs_write =3D dcs_w=
rite;
b7b23e4476872d8 Linus Walleij    2020-08-09  724  	dev_set_drvdata(dev, ctx=
);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  725  =

994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  726  	ctx->dev =3D dev;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  727  	ctx->enabled =3D fa=
lse;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  728  	ctx->prepared =3D f=
alse;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  729  =

1f20bf5921de420 Linus Walleij    2020-12-14  730  	ret =3D device_property_=
read_u32(dev, "max-brightness", &max_brightness);
1f20bf5921de420 Linus Walleij    2020-12-14  731  	if (ret)
1f20bf5921de420 Linus Walleij    2020-12-14  732  		max_brightness =3D MAX_=
BRIGHTNESS;
1f20bf5921de420 Linus Walleij    2020-12-14  733  	if (max_brightness > MAX=
_BRIGHTNESS) {
1f20bf5921de420 Linus Walleij    2020-12-14  734  		dev_err(dev, "illegal m=
ax brightness specified\n");
1f20bf5921de420 Linus Walleij    2020-12-14  735  		max_brightness =3D MAX_=
BRIGHTNESS;
1f20bf5921de420 Linus Walleij    2020-12-14  736  	}
1f20bf5921de420 Linus Walleij    2020-12-14  737  =

994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  738  	ctx->supplies[0].su=
pply =3D "vdd3";
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  739  	ctx->supplies[1].su=
pply =3D "vci";
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  740  	ret =3D devm_regula=
tor_bulk_get(dev, ARRAY_SIZE(ctx->supplies),
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  741  				      ctx->suppl=
ies);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  742  	if (ret < 0) {
5936b3bdaa88890 Sam Ravnborg     2020-08-15  743  		dev_err(dev, "failed to=
 get regulators: %d\n", ret);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  744  		return ret;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  745  	}
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  746  =

994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  747  	ctx->reset_gpio =3D=
 devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  748  	if (IS_ERR(ctx->res=
et_gpio)) {
5936b3bdaa88890 Sam Ravnborg     2020-08-15  749  		dev_err(dev, "cannot ge=
t reset-gpios %ld\n", PTR_ERR(ctx->reset_gpio));
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  750  		return PTR_ERR(ctx=
->reset_gpio);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  751  	}
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  752  =

d8fd58b542dcb1d Linus Walleij    2020-11-17  753  	irq =3D of_irq_get(dev->=
of_node, 0);
d8fd58b542dcb1d Linus Walleij    2020-11-17  754  	if (irq) {
d8fd58b542dcb1d Linus Walleij    2020-11-17 @755  		ret =3D devm_request_th=
readed_irq(dev, irq, NULL,
d8fd58b542dcb1d Linus Walleij    2020-11-17  756  						s6e63m0_esd_irq, IR=
QF_ONESHOT,
d8fd58b542dcb1d Linus Walleij    2020-11-17  757  						"s6e63m0-esd", ctx);
d8fd58b542dcb1d Linus Walleij    2020-11-17  758  	}
d8fd58b542dcb1d Linus Walleij    2020-11-17  759  =

9a2654c0f62a170 Laurent Pinchart 2019-09-04  760  	drm_panel_init(&ctx->pan=
el, dev, &s6e63m0_drm_funcs,
435e06c06cb2e3b Linus Walleij    2020-08-09  761  		       dsi_mode ? DRM_M=
ODE_CONNECTOR_DSI :
9a2654c0f62a170 Laurent Pinchart 2019-09-04  762  		       DRM_MODE_CONNECT=
OR_DPI);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  763  =

1f20bf5921de420 Linus Walleij    2020-12-14  764  	ret =3D s6e63m0_backligh=
t_register(ctx, max_brightness);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  765  	if (ret < 0)
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  766  		return ret;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  767  =

c3ee8c65f63799b Bernard Zhao     2020-08-01  768  	drm_panel_add(&ctx->pane=
l);
c3ee8c65f63799b Bernard Zhao     2020-08-01  769  =

c3ee8c65f63799b Bernard Zhao     2020-08-01  770  	return 0;
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  771  }
b7b23e4476872d8 Linus Walleij    2020-08-09  772  EXPORT_SYMBOL_GPL(s6e63m0=
_probe);
994a08a266e3e60 Pawe=C5=82 Chmiel     2019-02-22  773  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6268400385464691749==--

