Content-Type: multipart/mixed; boundary="===============8526347568730335036=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/platform/mellanox/mlxreg-lc.c:459:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 17:52:13 +0800
Message-ID: <202209041745.Tk8pj7Ek-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8526347568730335036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/p=
latform/mellanox/mlxreg-lc.c:459:13: warning: use of uninitialized value '<=
unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Vadim Pasternak <vadimp@nvidia.com>
CC: Hans de Goede <hdegoede@redhat.com>
CC: Michael Shych <michaelsh@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   7726d4c3e60bfe206738894267414a5f10510f1a
commit: 62f9529b8d5c87b89c3d9698405014bc8f370fbd platform/mellanox: mlxreg-=
lc: Add initial support for Nvidia line card devices
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm-randconfig-c002-20220829 (https://download.01.org/0day-ci/archi=
ve/20220904/202209041745.Tk8pj7Ek-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D62f9529b8d5c87b89c3d9698405014bc8f370fbd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 62f9529b8d5c87b89c3d9698405014bc8f370fbd
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/platform/mellanox/mlxreg-lc.c: In function 'mlxreg_lc_power_on_o=
ff':
>> drivers/platform/mellanox/mlxreg-lc.c:459:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     459 |         u32 regval;
         |             ^~~~~~
     'mlxreg_lc_power_on_off': event 1
       |
       |  459 |         u32 regval;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/platform/mellanox/mlxreg-lc.c: In function 'mlxreg_lc_enable_dis=
able':
   drivers/platform/mellanox/mlxreg-lc.c:482:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     482 |         u32 regval;
         |             ^~~~~~
     'mlxreg_lc_enable_disable': event 1
       |
       |  482 |         u32 regval;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/platform/mellanox/mlxreg-lc.c: In function 'mlxreg_lc_completion=
_notify':
   drivers/platform/mellanox/mlxreg-lc.c:634:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     634 |         u32 regval;
         |             ^~~~~~
     'mlxreg_lc_completion_notify': event 1
       |
       |  634 |         u32 regval;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/platform/mellanox/mlxreg-lc.c: In function 'mlxreg_lc_config_ini=
t':
   drivers/platform/mellanox/mlxreg-lc.c:706:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     706 |         int lsb, err;
         |             ^~~
     'mlxreg_lc_config_init': event 1
       |
       |  706 |         int lsb, err;
       |      |             ^~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |
   drivers/platform/mellanox/mlxreg-lc.c:707:13: warning: use of uninitiali=
zed value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     707 |         u32 regval;
         |             ^~~~~~
     'mlxreg_lc_config_init': event 1
       |
       |  707 |         u32 regval;
       |      |             ^~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
       |

vim +459 drivers/platform/mellanox/mlxreg-lc.c

62f9529b8d5c87 Vadim Pasternak 2021-10-02  456  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  457  static int mlxreg_lc_power_=
on_off(struct mlxreg_lc *mlxreg_lc, u8 action)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  458  {
62f9529b8d5c87 Vadim Pasternak 2021-10-02 @459  	u32 regval;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  460  	int err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  461  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  462  	mutex_lock(&mlxreg_lc->loc=
k);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  463  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  464  	err =3D regmap_read(mlxreg=
_lc->par_regmap, mlxreg_lc->data->reg_pwr, &regval);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  465  	if (err)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  466  		goto regmap_read_fail;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  467  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  468  	if (action)
62f9529b8d5c87 Vadim Pasternak 2021-10-02  469  		regval |=3D BIT(mlxreg_lc=
->data->slot - 1);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  470  	else
62f9529b8d5c87 Vadim Pasternak 2021-10-02  471  		regval &=3D ~BIT(mlxreg_l=
c->data->slot - 1);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  472  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  473  	err =3D regmap_write(mlxre=
g_lc->par_regmap, mlxreg_lc->data->reg_pwr, regval);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  474  =

62f9529b8d5c87 Vadim Pasternak 2021-10-02  475  regmap_read_fail:
62f9529b8d5c87 Vadim Pasternak 2021-10-02  476  	mutex_unlock(&mlxreg_lc->l=
ock);
62f9529b8d5c87 Vadim Pasternak 2021-10-02  477  	return err;
62f9529b8d5c87 Vadim Pasternak 2021-10-02  478  }
62f9529b8d5c87 Vadim Pasternak 2021-10-02  479  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8526347568730335036==--

