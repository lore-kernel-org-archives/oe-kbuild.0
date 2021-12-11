Content-Type: multipart/mixed; boundary="===============6165104561262274802=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH][RFC 1/2] Implement Ziegler-Nichols Heuristic
Date: Sat, 11 Dec 2021 12:28:35 +0800
Message-ID: <202112111243.7n3OVH4u-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6165104561262274802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211210163141.213106-1-chetan.mistry@arm.com>
References: <20211210163141.213106-1-chetan.mistry@arm.com>
TO: Chetankumar Mistry <chetan.mistry@arm.com>

Hi Chetankumar,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on linux/master linus/master v5.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Chetankumar-Mistry/Impleme=
nt-Ziegler-Nichols-Heuristic/20211211-003430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-m001-20211210 (https://download.01.org/0day-ci/ar=
chive/20211211/202112111243.7n3OVH4u-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/thermal/gov_power_allocator.c:1031 power_allocator_bind() warn: pos=
sible memory leak of 'params'

vim +/params +1031 drivers/thermal/gov_power_allocator.c

7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1003  =

6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1004  /**
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1005   * power_allocator_bind() - bind the power_allocator governo=
r to a thermal zone
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1006   * @tz:	thermal zone to bind it to
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1007   *
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1008   * Initialize the PID controller parameters and bind it to t=
he thermal
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1009   * zone.
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1010   *
7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1011   * Return: 0 on success, or -ENOMEM if we ran out of memory,=
 or -EINVAL
7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1012   * when there are unsupported cooling devices in the @tz.
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1013   */
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1014  static int power_allocator_bind(struct thermal_zone_device *=
tz)
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1015  {
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1016  	int ret;
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1017  	struct power_allocator_params *params;
e055bb0f9a6e5c drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1018  	int control_temp;
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1019  	struct zn_coefficients *zn_coeffs;
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1020  =

7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1021  	ret =3D check_power_actors(tz);
7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1022  	if (ret)
7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1023  		return ret;
7a583405f24bff drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
1-01-19  1024  =

cf736ea6f902c2 drivers/thermal/power_allocator.c     Dmitry Torokhov    201=
5-08-04  1025  	params =3D kzalloc(sizeof(*params), GFP_KERNEL);
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1026  	if (!params)
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1027  		return -ENOMEM;
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1028  =

91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1029  	zn_coeffs =3D kzalloc(sizeof(*zn_coeffs), GFP_KERNEL);
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1030  	if (!zn_coeffs)
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10 @1031  		return -ENOMEM;
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1032  =

91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1033  	params->zn_coeffs =3D zn_coeffs;
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1034  =

f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1035  	if (!tz->tzp) {
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1036  		tz->tzp =3D kzalloc(sizeof(*tz->tzp), GFP_KERNEL);
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1037  		if (!tz->tzp) {
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1038  			ret =3D -ENOMEM;
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1039  			goto free_params;
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1040  		}
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1041  =

f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1042  		params->allocated_tzp =3D true;
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1043  	}
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1044  =

e055bb0f9a6e5c drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1045  	if (!tz->tzp->sustainable_power)
e055bb0f9a6e5c drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1046  		dev_warn(&tz->device, "power_allocator: sustainable_power =
will be estimated\n");
e055bb0f9a6e5c drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1047  =

8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1048  	get_governor_trips(tz, params);
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1049  =

8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1050  	if (tz->trips > 0) {
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1051  		ret =3D tz->ops->get_trip_temp(tz,
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1052  					params->trip_max_desired_temperature,
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1053  					&control_temp);
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1054  		if (!ret)
e055bb0f9a6e5c drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1055  			estimate_pid_constants(tz, tz->tzp->sustainable_power,
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1056  					       params->trip_switch_on,
90a996544946d1 drivers/thermal/gov_power_allocator.c Lukasz Luba        202=
0-11-24  1057  					       control_temp);
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1058  		/* Store the original PID coefficient values */
91f16d6a958fcd drivers/thermal/gov_power_allocator.c Chetankumar Mistry 202=
1-12-10  1059  		set_original_pid_coefficients(tz->tzp);
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1060  	}
8b7b390f805f09 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1061  =

6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1062  	reset_pid_controller(params);
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1063  =

6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1064  	tz->governor_data =3D params;
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1065  =

6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1066  	return 0;
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1067  =

f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1068  free_params:
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1069  	kfree(params);
f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1070  =

f5cbb182586ea3 drivers/thermal/power_allocator.c     Javi Merino        201=
5-09-14  1071  	return ret;
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1072  }
6b775e870c56c5 drivers/thermal/power_allocator.c     Javi Merino        201=
5-03-02  1073  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6165104561262274802==--

