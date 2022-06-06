Content-Type: multipart/mixed; boundary="===============6449741913544306218=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/panel/panel-edp.c:836:3: warning: Value stored to 'desc' is never read [clang-analyzer-deadcode.DeadStores]
Date: Tue, 07 Jun 2022 04:47:44 +0800
Message-ID: <202206070416.y1mgra12-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6449741913544306218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/panel/panel-edp.c:836:3: warning: Value stored to 'desc' is never re=
ad [clang-analyzer-deadcode.DeadStores]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Douglas Anderson <dianders@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: 5540cf8f3e8dac7ef2de28edcf2623c1516fbe45 drm/panel-edp: Implement g=
eneric "edp-panel"s probed by EDID
date:   9 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 9 months ago
config: mips-randconfig-c004-20220604 (https://download.01.org/0day-ci/arch=
ive/20220607/202206070416.y1mgra12-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D5540cf8f3e8dac7ef2de28edcf2623c1516fbe45
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5540cf8f3e8dac7ef2de28edcf2623c1516fbe45
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dmips clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:191:2: note: Taking true branch
           if (likely(check_copy_size(to, n, false)))
           ^
   include/linux/uaccess.h:192:7: note: Calling '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:157:6: note: Left side of '&&' is true
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
               ^
   include/linux/uaccess.h:157:2: note: Taking true branch
           if (!should_fail_usercopy() && likely(access_ok(from, n))) {
           ^
   include/linux/uaccess.h:159:9: note: Calling 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/uaccess.h:455:2: note: Returning without writing t=
o 'to->fd'
           return __cu_len_r;
           ^
   include/linux/uaccess.h:159:9: note: Returning from 'raw_copy_from_user'
                   res =3D raw_copy_from_user(to, from, n);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:161:6: note: Assuming 'res' is 0
           if (unlikely(res))
               ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   include/linux/uaccess.h:161:2: note: Taking false branch
           if (unlikely(res))
           ^
   include/linux/uaccess.h:163:2: note: Returning without writing to 'to->f=
d'
           return res;
           ^
   include/linux/uaccess.h:192:7: note: Returning from '_copy_from_user'
                   n =3D _copy_from_user(to, from, n);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/uaccess.h:193:2: note: Returning without writing to 'to->f=
d'
           return n;
           ^
   fs/select.c:993:7: note: Returning from 'copy_from_user'
                   if (copy_from_user(walk->entries, ufds + nfds-todo,
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:993:3: note: Taking false branch
                   if (copy_from_user(walk->entries, ufds + nfds-todo,
                   ^
   fs/select.c:998:7: note: Assuming 'todo' is 0
                   if (!todo)
                       ^~~~~
   fs/select.c:998:3: note: Taking true branch
                   if (!todo)
                   ^
   fs/select.c:999:4: note:  Execution continues on line 1010
                           break;
                           ^
   fs/select.c:1011:12: note: Calling 'do_poll'
           fdcount =3D do_poll(head, &table, end_time);
                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:888:23: note: '?' condition is false
           __poll_t busy_flag =3D net_busy_loop_on() ? POLL_BUSY_LOOP : 0;
                                ^
   fs/select.c:892:6: note: 'end_time' is null
           if (end_time && !end_time->tv_sec && !end_time->tv_nsec) {
               ^~~~~~~~
   fs/select.c:892:15: note: Left side of '&&' is false
           if (end_time && !end_time->tv_sec && !end_time->tv_nsec) {
                        ^
   fs/select.c:897:6: note: 'end_time' is null
           if (end_time && !timed_out)
               ^~~~~~~~
   fs/select.c:897:15: note: Left side of '&&' is false
           if (end_time && !timed_out)
                        ^
   fs/select.c:900:2: note: Loop condition is true.  Entering loop body
           for (;;) {
           ^
   fs/select.c:904:3: note: Loop condition is true.  Entering loop body
                   for (walk =3D list; walk !=3D NULL; walk =3D walk->next)=
 {
                   ^
   fs/select.c:909:4: note: Loop condition is true.  Entering loop body
                           for (; pfd !=3D pfd_end; pfd++) {
                           ^
   fs/select.c:917:9: note: Calling 'do_pollfd'
                                   if (do_pollfd(pfd, pt, &can_busy_loop,
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/select.c:855:2: note: Assigned value is garbage or undefined
           int fd =3D pollfd->fd;
           ^        ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
>> drivers/gpu/drm/panel/panel-edp.c:836:3: warning: Value stored to 'desc'=
 is never read [clang-analyzer-deadcode.DeadStores]
                   desc =3D panel->desc;
                   ^      ~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-edp.c:836:3: note: Value stored to 'desc' is=
 never read
                   desc =3D panel->desc;
                   ^      ~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: warning: Value store=
d to 'dev' during its initialization is never read [clang-analyzer-deadcode=
.DeadStores]
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   drivers/gpu/drm/panel/panel-elida-kd35t133.c:65:17: note: Value stored t=
o 'dev' during its initialization is never read
           struct device *dev =3D ctx->dev;
                          ^~~   ~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: warning: Value stor=
ed to 'err' is never read [clang-analyzer-deadcode.DeadStores]
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-innolux-p079zca.c:459:3: note: Value stored =
to 'err' is never read
                   err =3D PTR_ERR(innolux->enable_gpio);
                   ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   drivers/of/property.c:920:19: warning: Access to field 'full_name' resul=
ts in a dereference of a null pointer [clang-analyzer-core.NullDereference]
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:920:19: note: '?' condition is false
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:920:19: note: Access to field 'full_name' results =
in a dereference of a null pointer
           return kbasename(to_of_node(fwnode)->full_name);
                            ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: warning: Access to field 'parent' results i=
n a dereference of a null pointer [clang-analyzer-core.NullDereference]
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   drivers/of/property.c:926:7: note: '?' condition is false
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:164:3: note: expanded from macro 'to_of_node'
                   is_of_node(__to_of_node_fwnode) ?                       \
                   ^
   drivers/of/property.c:926:7: note: Access to field 'parent' results in a=
 dereference of a null pointer
           if (!to_of_node(fwnode)->parent)
                ^
   include/linux/of.h:161:2: note: expanded from macro 'to_of_node'
           ({                                                              \
           ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/i2c/i2c-dev.c:443:7: warning: Branch condition evaluates to a ga=
rbage value [clang-analyzer-core.uninitialized.Branch]
                   if (!rdwr_arg.msgs || rdwr_arg.nmsgs =3D=3D 0)

vim +/desc +836 drivers/gpu/drm/panel/panel-edp.c

5540cf8f3e8dac Douglas Anderson 2021-09-14  752  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  753  static int panel_edp_probe=
(struct device *dev, const struct panel_desc *desc,
5f04e7ce392db9 Douglas Anderson 2021-09-14  754  			   struct drm_dp_aux *a=
ux)
5f04e7ce392db9 Douglas Anderson 2021-09-14  755  {
5f04e7ce392db9 Douglas Anderson 2021-09-14  756  	struct panel_edp *panel;
5f04e7ce392db9 Douglas Anderson 2021-09-14  757  	struct display_timing dt;
5f04e7ce392db9 Douglas Anderson 2021-09-14  758  	struct device_node *ddc;
5f04e7ce392db9 Douglas Anderson 2021-09-14  759  	int err;
5f04e7ce392db9 Douglas Anderson 2021-09-14  760  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  761  	panel =3D devm_kzalloc(de=
v, sizeof(*panel), GFP_KERNEL);
5f04e7ce392db9 Douglas Anderson 2021-09-14  762  	if (!panel)
5f04e7ce392db9 Douglas Anderson 2021-09-14  763  		return -ENOMEM;
5f04e7ce392db9 Douglas Anderson 2021-09-14  764  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  765  	panel->enabled =3D false;
5f04e7ce392db9 Douglas Anderson 2021-09-14  766  	panel->prepared_time =3D =
0;
5f04e7ce392db9 Douglas Anderson 2021-09-14  767  	panel->desc =3D desc;
5f04e7ce392db9 Douglas Anderson 2021-09-14  768  	panel->aux =3D aux;
5f04e7ce392db9 Douglas Anderson 2021-09-14  769  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  770  	panel->no_hpd =3D of_prop=
erty_read_bool(dev->of_node, "no-hpd");
5f04e7ce392db9 Douglas Anderson 2021-09-14  771  	if (!panel->no_hpd) {
5f04e7ce392db9 Douglas Anderson 2021-09-14  772  		err =3D panel_edp_get_hp=
d_gpio(dev, panel);
5f04e7ce392db9 Douglas Anderson 2021-09-14  773  		if (err)
5f04e7ce392db9 Douglas Anderson 2021-09-14  774  			return err;
5f04e7ce392db9 Douglas Anderson 2021-09-14  775  	}
5f04e7ce392db9 Douglas Anderson 2021-09-14  776  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  777  	panel->supply =3D devm_re=
gulator_get(dev, "power");
5f04e7ce392db9 Douglas Anderson 2021-09-14  778  	if (IS_ERR(panel->supply))
5f04e7ce392db9 Douglas Anderson 2021-09-14  779  		return PTR_ERR(panel->su=
pply);
5f04e7ce392db9 Douglas Anderson 2021-09-14  780  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  781  	panel->enable_gpio =3D de=
vm_gpiod_get_optional(dev, "enable",
5f04e7ce392db9 Douglas Anderson 2021-09-14  782  						     GPIOD_OUT_LOW);
5f04e7ce392db9 Douglas Anderson 2021-09-14  783  	if (IS_ERR(panel->enable_=
gpio)) {
5f04e7ce392db9 Douglas Anderson 2021-09-14  784  		err =3D PTR_ERR(panel->e=
nable_gpio);
5f04e7ce392db9 Douglas Anderson 2021-09-14  785  		if (err !=3D -EPROBE_DEF=
ER)
5f04e7ce392db9 Douglas Anderson 2021-09-14  786  			dev_err(dev, "failed to=
 request GPIO: %d\n", err);
5f04e7ce392db9 Douglas Anderson 2021-09-14  787  		return err;
5f04e7ce392db9 Douglas Anderson 2021-09-14  788  	}
5f04e7ce392db9 Douglas Anderson 2021-09-14  789  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  790  	err =3D of_drm_get_panel_=
orientation(dev->of_node, &panel->orientation);
5f04e7ce392db9 Douglas Anderson 2021-09-14  791  	if (err) {
5f04e7ce392db9 Douglas Anderson 2021-09-14  792  		dev_err(dev, "%pOF: fail=
ed to get orientation %d\n", dev->of_node, err);
5f04e7ce392db9 Douglas Anderson 2021-09-14  793  		return err;
5f04e7ce392db9 Douglas Anderson 2021-09-14  794  	}
5f04e7ce392db9 Douglas Anderson 2021-09-14  795  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  796  	ddc =3D of_parse_phandle(=
dev->of_node, "ddc-i2c-bus", 0);
5f04e7ce392db9 Douglas Anderson 2021-09-14  797  	if (ddc) {
5f04e7ce392db9 Douglas Anderson 2021-09-14  798  		panel->ddc =3D of_find_i=
2c_adapter_by_node(ddc);
5f04e7ce392db9 Douglas Anderson 2021-09-14  799  		of_node_put(ddc);
5f04e7ce392db9 Douglas Anderson 2021-09-14  800  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  801  		if (!panel->ddc)
5f04e7ce392db9 Douglas Anderson 2021-09-14  802  			return -EPROBE_DEFER;
5f04e7ce392db9 Douglas Anderson 2021-09-14  803  	} else if (aux) {
5f04e7ce392db9 Douglas Anderson 2021-09-14  804  		panel->ddc =3D &aux->ddc;
5f04e7ce392db9 Douglas Anderson 2021-09-14  805  	}
5f04e7ce392db9 Douglas Anderson 2021-09-14  806  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  807  	if (!of_get_display_timin=
g(dev->of_node, "panel-timing", &dt))
5f04e7ce392db9 Douglas Anderson 2021-09-14  808  		panel_edp_parse_panel_ti=
ming_node(dev, panel, &dt);
5f04e7ce392db9 Douglas Anderson 2021-09-14  809  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  810  	dev_set_drvdata(dev, pane=
l);
5f04e7ce392db9 Douglas Anderson 2021-09-14  811  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  812  	drm_panel_init(&panel->ba=
se, dev, &panel_edp_funcs, DRM_MODE_CONNECTOR_eDP);
5540cf8f3e8dac Douglas Anderson 2021-09-14  813  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  814  	err =3D drm_panel_of_back=
light(&panel->base);
5540cf8f3e8dac Douglas Anderson 2021-09-14  815  	if (err)
5540cf8f3e8dac Douglas Anderson 2021-09-14  816  		goto err_finished_ddc_in=
it;
5540cf8f3e8dac Douglas Anderson 2021-09-14  817  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  818  	/*
5f04e7ce392db9 Douglas Anderson 2021-09-14  819  	 * We use runtime PM for =
prepare / unprepare since those power the panel
5f04e7ce392db9 Douglas Anderson 2021-09-14  820  	 * on and off and those c=
an be very slow operations. This is important
5f04e7ce392db9 Douglas Anderson 2021-09-14  821  	 * to optimize powering t=
he panel on briefly to read the EDID before
5f04e7ce392db9 Douglas Anderson 2021-09-14  822  	 * fully enabling the pan=
el.
5f04e7ce392db9 Douglas Anderson 2021-09-14  823  	 */
5f04e7ce392db9 Douglas Anderson 2021-09-14  824  	pm_runtime_enable(dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  825  	pm_runtime_set_autosuspen=
d_delay(dev, 1000);
5f04e7ce392db9 Douglas Anderson 2021-09-14  826  	pm_runtime_use_autosuspen=
d(dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  827  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  828  	if (of_device_is_compatib=
le(dev->of_node, "edp-panel")) {
5540cf8f3e8dac Douglas Anderson 2021-09-14  829  		err =3D generic_edp_pane=
l_probe(dev, panel);
5540cf8f3e8dac Douglas Anderson 2021-09-14  830  		if (err) {
5540cf8f3e8dac Douglas Anderson 2021-09-14  831  			dev_err_probe(dev, err,
5540cf8f3e8dac Douglas Anderson 2021-09-14  832  				      "Couldn't detect=
 panel nor find a fallback\n");
5540cf8f3e8dac Douglas Anderson 2021-09-14  833  			goto err_finished_pm_ru=
ntime;
5540cf8f3e8dac Douglas Anderson 2021-09-14  834  		}
5540cf8f3e8dac Douglas Anderson 2021-09-14  835  		/* generic_edp_panel_pro=
be() replaces desc in the panel */
5540cf8f3e8dac Douglas Anderson 2021-09-14 @836  		desc =3D panel->desc;
5540cf8f3e8dac Douglas Anderson 2021-09-14  837  	} else if (desc->bpc !=3D=
 6 && desc->bpc !=3D 8 && desc->bpc !=3D 10) {
5540cf8f3e8dac Douglas Anderson 2021-09-14  838  		dev_warn(dev, "Expected =
bpc in {6,8,10} but got: %u\n", desc->bpc);
5540cf8f3e8dac Douglas Anderson 2021-09-14  839  	}
5f04e7ce392db9 Douglas Anderson 2021-09-14  840  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  841  	if (!panel->base.backligh=
t && panel->aux) {
5f04e7ce392db9 Douglas Anderson 2021-09-14  842  		pm_runtime_get_sync(dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  843  		err =3D drm_panel_dp_aux=
_backlight(&panel->base, panel->aux);
5f04e7ce392db9 Douglas Anderson 2021-09-14  844  		pm_runtime_mark_last_bus=
y(dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  845  		pm_runtime_put_autosuspe=
nd(dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  846  		if (err)
5540cf8f3e8dac Douglas Anderson 2021-09-14  847  			goto err_finished_pm_ru=
ntime;
5f04e7ce392db9 Douglas Anderson 2021-09-14  848  	}
5f04e7ce392db9 Douglas Anderson 2021-09-14  849  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  850  	drm_panel_add(&panel->bas=
e);
5f04e7ce392db9 Douglas Anderson 2021-09-14  851  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  852  	return 0;
5f04e7ce392db9 Douglas Anderson 2021-09-14  853  =

5540cf8f3e8dac Douglas Anderson 2021-09-14  854  err_finished_pm_runtime:
5f04e7ce392db9 Douglas Anderson 2021-09-14  855  	pm_runtime_dont_use_autos=
uspend(dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  856  	pm_runtime_disable(dev);
5540cf8f3e8dac Douglas Anderson 2021-09-14  857  err_finished_ddc_init:
5f04e7ce392db9 Douglas Anderson 2021-09-14  858  	if (panel->ddc && (!panel=
->aux || panel->ddc !=3D &panel->aux->ddc))
5f04e7ce392db9 Douglas Anderson 2021-09-14  859  		put_device(&panel->ddc->=
dev);
5f04e7ce392db9 Douglas Anderson 2021-09-14  860  =

5f04e7ce392db9 Douglas Anderson 2021-09-14  861  	return err;
5f04e7ce392db9 Douglas Anderson 2021-09-14  862  }
5f04e7ce392db9 Douglas Anderson 2021-09-14  863  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6449741913544306218==--

