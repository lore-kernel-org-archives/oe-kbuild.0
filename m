Content-Type: multipart/mixed; boundary="===============6243377288993896661=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Intel-gfx] [PATCH 5/6] drm/i915/tc/icl: Implement the TC cold exit sequence
Date: Fri, 20 Mar 2020 16:11:12 +0300
Message-ID: <20200320131112.GG4650@kadam>
In-Reply-To: <20200318235956.118409-5-jose.souza@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6243377288993896661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Jos=C3=A9,

Thank you for the patch! Perhaps something to improve:

url:    https://github.com/0day-ci/linux/commits/Jos-Roberto-de-Souza/drm-i=
915-tc-tgl-Implement-TCCOLD-sequences/20200319-080253
base:   git://anongit.freedesktop.org/drm-intel for-linux-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/gpu/drm/i915/display/intel_tc.c:554 icl_tc_cold_request() error: un=
initialized symbol 'ret'.

# https://github.com/0day-ci/linux/commit/29f27e6df6ad82b09a3c9ddaf5f51b2fc=
1647178
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 29f27e6df6ad82b09a3c9ddaf5f51b2fc1647178
vim +/ret +554 drivers/gpu/drm/i915/display/intel_tc.c

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  528  static inline in=
t icl_tc_cold_request(struct intel_digital_port *dig_port,
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  529  				      bool b=
lock)
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  530  {
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  531  	struct drm_i915=
_private *i915 =3D to_i915(dig_port->base.base.dev);
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  532  	enum intel_disp=
lay_power_domain aux_domain;
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  533  	int ret;
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  534  =

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  535  	aux_domain =3D =
intel_aux_ch_to_power_domain(dig_port->aux_ch);
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  536  =

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  537  	if (block) {
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  538  		dig_port->tc_c=
old_wakeref =3D
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  539  			intel_display=
_power_get_without_ack(i915, aux_domain);
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  540  =

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  541  		do {
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  542  			ret =3D sandy=
bridge_pcode_write_timeout(i915,
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  543  							      ICL=
_PCODE_EXIT_TCCOLD,
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  544  							      0, =
250, 1);
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  545  =

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  546  		} while (ret =
=3D=3D -EAGAIN);

ret is only initialized on this path

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  547  	} else if (dig_=
port->tc_mode =3D=3D TC_PORT_LEGACY) {
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  548  		drm_WARN_ON(&i=
915->drm, !dig_port->tc_lock_wakeref);
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  549  		intel_display_=
power_put(i915, aux_domain,
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  550  					dig_port->t=
c_cold_wakeref);
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  551  		dig_port->tc_c=
old_wakeref =3D 0;
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  552  	}
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  553  =

29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18 @554  	return ret;
29f27e6df6ad82 Jos=C3=A9 Roberto de Souza 2020-03-18  555  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6243377288993896661==--

