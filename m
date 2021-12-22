Content-Type: multipart/mixed; boundary="===============0040855094030951251=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 1/2] firmware: arm_scmi: Filter out negative results on scmi_reading_get
Date: Wed, 22 Dec 2021 20:49:47 +0800
Message-ID: <202112222052.WENrQg3R-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0040855094030951251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211220174155.40239-2-cristian.marussi@arm.com>
References: <20211220174155.40239-2-cristian.marussi@arm.com>
TO: Cristian Marussi <cristian.marussi@arm.com>

Hi Cristian,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linux/master]
[also build test WARNING on groeck-staging/hwmon-next soc/for-next linus/ma=
ster v5.16-rc6 next-20211221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cristian-Marussi/Sensor-re=
adings-fixes/20211221-014235
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
136057256686de39cc3a07c2e39ef6bc43003ff6
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: csky-randconfig-s031-20211222 (https://download.01.org/0day-ci/arch=
ive/20211222/202112222052.WENrQg3R-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/6f0ec7d066a305bdb889a75e7=
72ef0be72f365f9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cristian-Marussi/Sensor-readings-f=
ixes/20211221-014235
        git checkout 6f0ec7d066a305bdb889a75e772ef0be72f365f9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dc=
sky SHELL=3D/bin/bash drivers/firmware/arm_scmi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/firmware/arm_scmi/sensors.c:640:28: sparse: sparse: incorrect ty=
pe in argument 1 (different base types) @@     expected unsigned int [usert=
ype] val @@     got restricted __le32 [usertype] @@
   drivers/firmware/arm_scmi/sensors.c:640:28: sparse:     expected unsigne=
d int [usertype] val
   drivers/firmware/arm_scmi/sensors.c:640:28: sparse:     got restricted _=
_le32 [usertype]
>> drivers/firmware/arm_scmi/sensors.c:733:70: sparse: sparse: shift too bi=
g (63) for type unsigned long

vim +733 drivers/firmware/arm_scmi/sensors.c

5179c523c1eae4 Sudeep Holla     2017-06-06  628  =

9694a7f6235934 Cristian Marussi 2021-03-16  629  static int scmi_sensor_con=
fig_get(const struct scmi_protocol_handle *ph,
7b83c5f4108898 Cristian Marussi 2020-11-19  630  				  u32 sensor_id, u32 *=
sensor_config)
7b83c5f4108898 Cristian Marussi 2020-11-19  631  {
7b83c5f4108898 Cristian Marussi 2020-11-19  632  	int ret;
7b83c5f4108898 Cristian Marussi 2020-11-19  633  	struct scmi_xfer *t;
7b83c5f4108898 Cristian Marussi 2020-11-19  634  =

9694a7f6235934 Cristian Marussi 2021-03-16  635  	ret =3D ph->xops->xfer_ge=
t_init(ph, SENSOR_CONFIG_GET,
9694a7f6235934 Cristian Marussi 2021-03-16  636  				      sizeof(__le32), =
sizeof(__le32), &t);
7b83c5f4108898 Cristian Marussi 2020-11-19  637  	if (ret)
7b83c5f4108898 Cristian Marussi 2020-11-19  638  		return ret;
7b83c5f4108898 Cristian Marussi 2020-11-19  639  =

7b83c5f4108898 Cristian Marussi 2020-11-19 @640  	put_unaligned_le32(cpu_to=
_le32(sensor_id), t->tx.buf);
9694a7f6235934 Cristian Marussi 2021-03-16  641  	ret =3D ph->xops->do_xfer=
(ph, t);
7b83c5f4108898 Cristian Marussi 2020-11-19  642  	if (!ret) {
9694a7f6235934 Cristian Marussi 2021-03-16  643  		struct sensors_info *si =
=3D ph->get_priv(ph);
7b83c5f4108898 Cristian Marussi 2020-11-19  644  		struct scmi_sensor_info =
*s =3D si->sensors + sensor_id;
7b83c5f4108898 Cristian Marussi 2020-11-19  645  =

7b83c5f4108898 Cristian Marussi 2020-11-19  646  		*sensor_config =3D get_u=
naligned_le64(t->rx.buf);
7b83c5f4108898 Cristian Marussi 2020-11-19  647  		s->sensor_config =3D *se=
nsor_config;
7b83c5f4108898 Cristian Marussi 2020-11-19  648  	}
7b83c5f4108898 Cristian Marussi 2020-11-19  649  =

9694a7f6235934 Cristian Marussi 2021-03-16  650  	ph->xops->xfer_put(ph, t);
7b83c5f4108898 Cristian Marussi 2020-11-19  651  	return ret;
7b83c5f4108898 Cristian Marussi 2020-11-19  652  }
7b83c5f4108898 Cristian Marussi 2020-11-19  653  =

9694a7f6235934 Cristian Marussi 2021-03-16  654  static int scmi_sensor_con=
fig_set(const struct scmi_protocol_handle *ph,
7b83c5f4108898 Cristian Marussi 2020-11-19  655  				  u32 sensor_id, u32 s=
ensor_config)
7b83c5f4108898 Cristian Marussi 2020-11-19  656  {
7b83c5f4108898 Cristian Marussi 2020-11-19  657  	int ret;
7b83c5f4108898 Cristian Marussi 2020-11-19  658  	struct scmi_xfer *t;
7b83c5f4108898 Cristian Marussi 2020-11-19  659  	struct scmi_msg_sensor_co=
nfig_set *msg;
7b83c5f4108898 Cristian Marussi 2020-11-19  660  =

9694a7f6235934 Cristian Marussi 2021-03-16  661  	ret =3D ph->xops->xfer_ge=
t_init(ph, SENSOR_CONFIG_SET,
9694a7f6235934 Cristian Marussi 2021-03-16  662  				      sizeof(*msg), 0,=
 &t);
7b83c5f4108898 Cristian Marussi 2020-11-19  663  	if (ret)
7b83c5f4108898 Cristian Marussi 2020-11-19  664  		return ret;
7b83c5f4108898 Cristian Marussi 2020-11-19  665  =

7b83c5f4108898 Cristian Marussi 2020-11-19  666  	msg =3D t->tx.buf;
7b83c5f4108898 Cristian Marussi 2020-11-19  667  	msg->id =3D cpu_to_le32(s=
ensor_id);
7b83c5f4108898 Cristian Marussi 2020-11-19  668  	msg->sensor_config =3D cp=
u_to_le32(sensor_config);
7b83c5f4108898 Cristian Marussi 2020-11-19  669  =

9694a7f6235934 Cristian Marussi 2021-03-16  670  	ret =3D ph->xops->do_xfer=
(ph, t);
7b83c5f4108898 Cristian Marussi 2020-11-19  671  	if (!ret) {
9694a7f6235934 Cristian Marussi 2021-03-16  672  		struct sensors_info *si =
=3D ph->get_priv(ph);
7b83c5f4108898 Cristian Marussi 2020-11-19  673  		struct scmi_sensor_info =
*s =3D si->sensors + sensor_id;
7b83c5f4108898 Cristian Marussi 2020-11-19  674  =

7b83c5f4108898 Cristian Marussi 2020-11-19  675  		s->sensor_config =3D sen=
sor_config;
7b83c5f4108898 Cristian Marussi 2020-11-19  676  	}
7b83c5f4108898 Cristian Marussi 2020-11-19  677  =

9694a7f6235934 Cristian Marussi 2021-03-16  678  	ph->xops->xfer_put(ph, t);
7b83c5f4108898 Cristian Marussi 2020-11-19  679  	return ret;
7b83c5f4108898 Cristian Marussi 2020-11-19  680  }
7b83c5f4108898 Cristian Marussi 2020-11-19  681  =

e2083d36739168 Cristian Marussi 2020-11-19  682  /**
e2083d36739168 Cristian Marussi 2020-11-19  683   * scmi_sensor_reading_get=
  - Read scalar sensor value
9694a7f6235934 Cristian Marussi 2021-03-16  684   * @ph: Protocol handle
e2083d36739168 Cristian Marussi 2020-11-19  685   * @sensor_id: Sensor ID
e2083d36739168 Cristian Marussi 2020-11-19  686   * @value: The 64bit value=
 sensor reading
e2083d36739168 Cristian Marussi 2020-11-19  687   *
e2083d36739168 Cristian Marussi 2020-11-19  688   * This function returns a=
 single 64 bit reading value representing the sensor
e2083d36739168 Cristian Marussi 2020-11-19  689   * value; if the platform =
SCMI Protocol implementation and the sensor support
e2083d36739168 Cristian Marussi 2020-11-19  690   * multiple axis and times=
tamped-reads, this just returns the first axis while
e2083d36739168 Cristian Marussi 2020-11-19  691   * dropping the timestamp =
value.
e2083d36739168 Cristian Marussi 2020-11-19  692   * Use instead the @scmi_s=
ensor_reading_get_timestamped to retrieve the array of
e2083d36739168 Cristian Marussi 2020-11-19  693   * timestamped multi-axis =
values.
e2083d36739168 Cristian Marussi 2020-11-19  694   *
e2083d36739168 Cristian Marussi 2020-11-19  695   * Return: 0 on Success
e2083d36739168 Cristian Marussi 2020-11-19  696   */
9694a7f6235934 Cristian Marussi 2021-03-16  697  static int scmi_sensor_rea=
ding_get(const struct scmi_protocol_handle *ph,
6a55331c87d86a Sudeep Holla     2019-07-08  698  				   u32 sensor_id, u64 =
*value)
5179c523c1eae4 Sudeep Holla     2017-06-06  699  {
5179c523c1eae4 Sudeep Holla     2017-06-06  700  	int ret;
5179c523c1eae4 Sudeep Holla     2017-06-06  701  	struct scmi_xfer *t;
5179c523c1eae4 Sudeep Holla     2017-06-06  702  	struct scmi_msg_sensor_re=
ading_get *sensor;
9694a7f6235934 Cristian Marussi 2021-03-16  703  	struct sensors_info *si =
=3D ph->get_priv(ph);
d09aac0eb17c6c Sudeep Holla     2019-07-08  704  	struct scmi_sensor_info *=
s =3D si->sensors + sensor_id;
5179c523c1eae4 Sudeep Holla     2017-06-06  705  =

9694a7f6235934 Cristian Marussi 2021-03-16  706  	ret =3D ph->xops->xfer_ge=
t_init(ph, SENSOR_READING_GET,
9694a7f6235934 Cristian Marussi 2021-03-16  707  				      sizeof(*sensor),=
 0, &t);
5179c523c1eae4 Sudeep Holla     2017-06-06  708  	if (ret)
5179c523c1eae4 Sudeep Holla     2017-06-06  709  		return ret;
5179c523c1eae4 Sudeep Holla     2017-06-06  710  =

5179c523c1eae4 Sudeep Holla     2017-06-06  711  	sensor =3D t->tx.buf;
5179c523c1eae4 Sudeep Holla     2017-06-06  712  	sensor->id =3D cpu_to_le3=
2(sensor_id);
d09aac0eb17c6c Sudeep Holla     2019-07-08  713  	if (s->async) {
d09aac0eb17c6c Sudeep Holla     2019-07-08  714  		sensor->flags =3D cpu_to=
_le32(SENSOR_READ_ASYNC);
9694a7f6235934 Cristian Marussi 2021-03-16  715  		ret =3D ph->xops->do_xfe=
r_with_response(ph, t);
e2083d36739168 Cristian Marussi 2020-11-19  716  		if (!ret) {
e2083d36739168 Cristian Marussi 2020-11-19  717  			struct scmi_resp_sensor=
_reading_complete *resp;
e2083d36739168 Cristian Marussi 2020-11-19  718  =

e2083d36739168 Cristian Marussi 2020-11-19  719  			resp =3D t->rx.buf;
e2083d36739168 Cristian Marussi 2020-11-19  720  			if (le32_to_cpu(resp->i=
d) =3D=3D sensor_id)
187a002b07e808 Cristian Marussi 2021-06-28  721  				*value =3D
187a002b07e808 Cristian Marussi 2021-06-28  722  					get_unaligned_le64(&r=
esp->readings_low);
e2083d36739168 Cristian Marussi 2020-11-19  723  			else
e2083d36739168 Cristian Marussi 2020-11-19  724  				ret =3D -EPROTO;
e2083d36739168 Cristian Marussi 2020-11-19  725  		}
d09aac0eb17c6c Sudeep Holla     2019-07-08  726  	} else {
d09aac0eb17c6c Sudeep Holla     2019-07-08  727  		sensor->flags =3D cpu_to=
_le32(0);
9694a7f6235934 Cristian Marussi 2021-03-16  728  		ret =3D ph->xops->do_xfe=
r(ph, t);
aa90ac45bc88e6 Sudeep Holla     2019-08-07  729  		if (!ret)
aa90ac45bc88e6 Sudeep Holla     2019-08-07  730  			*value =3D get_unaligne=
d_le64(t->rx.buf);
d09aac0eb17c6c Sudeep Holla     2019-07-08  731  	}
5179c523c1eae4 Sudeep Holla     2017-06-06  732  =

6f0ec7d066a305 Cristian Marussi 2021-12-20 @733  	if (!ret && si->version >=
 SCMIv2_SENSOR_PROTOCOL && *value & BIT(63)) {
6f0ec7d066a305 Cristian Marussi 2021-12-20  734  		dev_warn_once(ph->dev,
6f0ec7d066a305 Cristian Marussi 2021-12-20  735  			      "SCMI FW Sensor v=
ersion:0x%X reported negative value %ld\n",
6f0ec7d066a305 Cristian Marussi 2021-12-20  736  			      si->version, (lon=
g)*value);
6f0ec7d066a305 Cristian Marussi 2021-12-20  737  		*value =3D 0;
6f0ec7d066a305 Cristian Marussi 2021-12-20  738  		ret =3D -EIO;
6f0ec7d066a305 Cristian Marussi 2021-12-20  739  	}
6f0ec7d066a305 Cristian Marussi 2021-12-20  740  =

9694a7f6235934 Cristian Marussi 2021-03-16  741  	ph->xops->xfer_put(ph, t);
5179c523c1eae4 Sudeep Holla     2017-06-06  742  	return ret;
5179c523c1eae4 Sudeep Holla     2017-06-06  743  }
5179c523c1eae4 Sudeep Holla     2017-06-06  744  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0040855094030951251==--

