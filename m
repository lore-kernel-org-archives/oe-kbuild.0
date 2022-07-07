Content-Type: multipart/mixed; boundary="===============2951831593691055435=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
Date: Fri, 08 Jul 2022 02:36:20 +0800
Message-ID: <202207080257.3FTiq7CK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2951831593691055435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/powerpc/kernel/prom.c:891:5: warning: no previous prototype for 'of_g=
et_ibm_chip_id' [-Wmissing-prototypes]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <22ac0b64b6c6ef6cc6a74739eb213a81372835ed.1657204012.git.chris=
tophe.leroy@csgroup.eu>
References: <22ac0b64b6c6ef6cc6a74739eb213a81372835ed.1657204012.git.christ=
ophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
TO: Paul Mackerras <paulus@samba.org>
TO: Michael Ellerman <mpe@ellerman.id.au>
CC: linuxppc-dev(a)lists.ozlabs.org
CC: linux-kernel(a)vger.kernel.org

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on mkp-scsi/for-next jejb-scsi/for-next linus/mast=
er v5.19-rc5 next-20220707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/vid=
eo-fbdev-offb-Include-missing-linux-platform_device-h/20220707-222906
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git n=
ext
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: powerpc-randconfig-s032-20220707 (https://download.01.org/0day-ci/a=
rchive/20220708/202207080257.3FTiq7CK-lkp(a)intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/0e553b9abdcfd7c1f63=
b072e9d9280ce759c0c3c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christophe-Leroy/video-fbdev-offb-=
Include-missing-linux-platform_device-h/20220707-222906
        git checkout 0e553b9abdcfd7c1f63b072e9d9280ce759c0c3c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dp=
owerpc SHELL=3D/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/prom.c:891:5: warning: no previous prototype for 'of=
_get_ibm_chip_id' [-Wmissing-prototypes]
     891 | int of_get_ibm_chip_id(struct device_node *np)
         |     ^~~~~~~~~~~~~~~~~~


vim +/of_get_ibm_chip_id +891 arch/powerpc/kernel/prom.c

b27652dd2174df1 Kevin Hao              2013-12-24  871  =

9b6b563c0d2d25e Paul Mackerras         2005-10-06  872  /*******
9b6b563c0d2d25e Paul Mackerras         2005-10-06  873   *
9b6b563c0d2d25e Paul Mackerras         2005-10-06  874   * New implementati=
on of the OF "find" APIs, return a refcounted
9b6b563c0d2d25e Paul Mackerras         2005-10-06  875   * object, call of_=
node_put() when done.  The device tree and list
9b6b563c0d2d25e Paul Mackerras         2005-10-06  876   * are protected by=
 a rw_lock.
9b6b563c0d2d25e Paul Mackerras         2005-10-06  877   *
9b6b563c0d2d25e Paul Mackerras         2005-10-06  878   * Note that proper=
ty management will need some locking as well,
9b6b563c0d2d25e Paul Mackerras         2005-10-06  879   * this isn't dealt=
 with yet.
9b6b563c0d2d25e Paul Mackerras         2005-10-06  880   *
9b6b563c0d2d25e Paul Mackerras         2005-10-06  881   *******/
9b6b563c0d2d25e Paul Mackerras         2005-10-06  882  =

b37193b71846858 Benjamin Herrenschmidt 2013-07-15  883  /**
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  884   * of_get_ibm_chip_=
id - Returns the IBM "chip-id" of a device
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  885   * @np: device node=
 of the device
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  886   *
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  887   * This looks for a=
 property "ibm,chip-id" in the node or any
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  888   * of its parents a=
nd returns its content, or -1 if it cannot
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  889   * be found.
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  890   */
b37193b71846858 Benjamin Herrenschmidt 2013-07-15 @891  int of_get_ibm_chip=
_id(struct device_node *np)
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  892  {
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  893  	of_node_get(np);
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  894  	while (np) {
1856f50c66dff0a Christophe Jaillet     2015-10-16  895  		u32 chip_id;
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  896  =

1856f50c66dff0a Christophe Jaillet     2015-10-16  897  		/*
1856f50c66dff0a Christophe Jaillet     2015-10-16  898  		 * Skiboot may pr=
oduce memory nodes that contain more than one
1856f50c66dff0a Christophe Jaillet     2015-10-16  899  		 * cell in chip-i=
d, we only read the first one here.
1856f50c66dff0a Christophe Jaillet     2015-10-16  900  		 */
1856f50c66dff0a Christophe Jaillet     2015-10-16  901  		if (!of_property_=
read_u32(np, "ibm,chip-id", &chip_id)) {
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  902  			of_node_put(np);
1856f50c66dff0a Christophe Jaillet     2015-10-16  903  			return chip_id;
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  904  		}
16c1d606263ea37 Michael Ellerman       2015-10-26  905  =

16c1d606263ea37 Michael Ellerman       2015-10-26  906  		np =3D of_get_nex=
t_parent(np);
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  907  	}
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  908  	return -1;
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  909  }
b130e7c04f1130f Dan Streetman          2015-05-07  910  EXPORT_SYMBOL(of_ge=
t_ibm_chip_id);
b37193b71846858 Benjamin Herrenschmidt 2013-07-15  911  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2951831593691055435==--

