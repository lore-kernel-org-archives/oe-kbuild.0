Content-Type: multipart/mixed; boundary="===============1634227664433499807=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sudeep-holla:for-next/scmi 16/23] drivers/firmware/arm_scmi/powercap.c:331:17: sparse: sparse: dubious: x & !y
Date: Sun, 03 Jul 2022 14:36:41 +0800
Message-ID: <202207031457.lWJ2gkod-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1634227664433499807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/f=
irmware/arm_scmi/powercap.c:331:17: sparse: sparse: dubious: x & !y"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.=
git for-next/scmi
head:   78dd442898d8908535e7d00edcdbcf44593aa71f
commit: 4eae85df44a2a5cd4c067c2fc297d5f5c02de485 [16/23] firmware: arm_scmi=
: Add SCMIv3.1 Powercap protocol basic support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-s032-20220703 (https://download.01.org/0day-ci/archi=
ve/20220703/202207031457.lWJ2gkod-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linu=
x.git/commit/?id=3D4eae85df44a2a5cd4c067c2fc297d5f5c02de485
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/ke=
rnel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla for-next/scmi
        git checkout 4eae85df44a2a5cd4c067c2fc297d5f5c02de485
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash arch/arm/kernel/ drivers/firmware/arm_scmi/ drivers/mi=
sc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/powercap.c:331:17: sparse: sparse: dubious: x =
& !y
>> drivers/firmware/arm_scmi/powercap.c:331:17: sparse: sparse: dubious: x =
& !y

vim +331 drivers/firmware/arm_scmi/powercap.c

4eae85df44a2a5 Cristian Marussi 2022-06-27  307  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  308  static int scmi_powercap_c=
ap_set(const struct scmi_protocol_handle *ph,
4eae85df44a2a5 Cristian Marussi 2022-06-27  309  				 u32 domain_id, u32 po=
wer_cap,
4eae85df44a2a5 Cristian Marussi 2022-06-27  310  				 bool ignore_dresp)
4eae85df44a2a5 Cristian Marussi 2022-06-27  311  {
4eae85df44a2a5 Cristian Marussi 2022-06-27  312  	int ret;
4eae85df44a2a5 Cristian Marussi 2022-06-27  313  	struct scmi_xfer *t;
4eae85df44a2a5 Cristian Marussi 2022-06-27  314  	struct scmi_msg_powercap_=
set_cap_or_pai *msg;
4eae85df44a2a5 Cristian Marussi 2022-06-27  315  	const struct scmi_powerca=
p_info *pc;
4eae85df44a2a5 Cristian Marussi 2022-06-27  316  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  317  	pc =3D scmi_powercap_dom_=
info_get(ph, domain_id);
4eae85df44a2a5 Cristian Marussi 2022-06-27  318  	if (!pc || !pc->powercap_=
cap_config || !power_cap ||
4eae85df44a2a5 Cristian Marussi 2022-06-27  319  	    power_cap < pc->min_p=
ower_cap ||
4eae85df44a2a5 Cristian Marussi 2022-06-27  320  	    power_cap > pc->max_p=
ower_cap)
4eae85df44a2a5 Cristian Marussi 2022-06-27  321  		return -EINVAL;
4eae85df44a2a5 Cristian Marussi 2022-06-27  322  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  323  	ret =3D ph->xops->xfer_ge=
t_init(ph, POWERCAP_CAP_SET,
4eae85df44a2a5 Cristian Marussi 2022-06-27  324  				      sizeof(*msg), 0,=
 &t);
4eae85df44a2a5 Cristian Marussi 2022-06-27  325  	if (ret)
4eae85df44a2a5 Cristian Marussi 2022-06-27  326  		return ret;
4eae85df44a2a5 Cristian Marussi 2022-06-27  327  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  328  	msg =3D t->tx.buf;
4eae85df44a2a5 Cristian Marussi 2022-06-27  329  	msg->domain =3D cpu_to_le=
32(domain_id);
4eae85df44a2a5 Cristian Marussi 2022-06-27  330  	msg->flags =3D
4eae85df44a2a5 Cristian Marussi 2022-06-27 @331  		cpu_to_le32(FIELD_PREP(C=
AP_SET_ASYNC, !!pc->async_powercap_cap_set) |
4eae85df44a2a5 Cristian Marussi 2022-06-27  332  			    FIELD_PREP(CAP_SET_=
IGNORE_DRESP, !!ignore_dresp));
4eae85df44a2a5 Cristian Marussi 2022-06-27  333  	msg->value =3D cpu_to_le3=
2(power_cap);
4eae85df44a2a5 Cristian Marussi 2022-06-27  334  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  335  	if (!pc->async_powercap_c=
ap_set || ignore_dresp) {
4eae85df44a2a5 Cristian Marussi 2022-06-27  336  		ret =3D ph->xops->do_xfe=
r(ph, t);
4eae85df44a2a5 Cristian Marussi 2022-06-27  337  	} else {
4eae85df44a2a5 Cristian Marussi 2022-06-27  338  		ret =3D ph->xops->do_xfe=
r_with_response(ph, t);
4eae85df44a2a5 Cristian Marussi 2022-06-27  339  		if (!ret) {
4eae85df44a2a5 Cristian Marussi 2022-06-27  340  			struct scmi_msg_resp_po=
wercap_cap_set_complete *resp;
4eae85df44a2a5 Cristian Marussi 2022-06-27  341  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  342  			resp =3D t->rx.buf;
4eae85df44a2a5 Cristian Marussi 2022-06-27  343  			if (le32_to_cpu(resp->d=
omain) =3D=3D domain_id)
4eae85df44a2a5 Cristian Marussi 2022-06-27  344  				dev_dbg(ph->dev,
4eae85df44a2a5 Cristian Marussi 2022-06-27  345  					"Powercap ID %d CAP s=
et async to %u\n",
4eae85df44a2a5 Cristian Marussi 2022-06-27  346  					domain_id,
4eae85df44a2a5 Cristian Marussi 2022-06-27  347  					get_unaligned_le32(&r=
esp->power_cap));
4eae85df44a2a5 Cristian Marussi 2022-06-27  348  			else
4eae85df44a2a5 Cristian Marussi 2022-06-27  349  				ret =3D -EPROTO;
4eae85df44a2a5 Cristian Marussi 2022-06-27  350  		}
4eae85df44a2a5 Cristian Marussi 2022-06-27  351  	}
4eae85df44a2a5 Cristian Marussi 2022-06-27  352  =

4eae85df44a2a5 Cristian Marussi 2022-06-27  353  	ph->xops->xfer_put(ph, t);
4eae85df44a2a5 Cristian Marussi 2022-06-27  354  	return ret;
4eae85df44a2a5 Cristian Marussi 2022-06-27  355  }
4eae85df44a2a5 Cristian Marussi 2022-06-27  356  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============1634227664433499807==--

