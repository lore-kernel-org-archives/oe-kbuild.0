Content-Type: multipart/mixed; boundary="===============2311956932747822689=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 10/13] iio: imu: inv_icm42600: add buffer support in iio devices
Date: Wed, 10 Jun 2020 23:00:26 +0800
Message-ID: <202006102239.mmSyLiil%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2311956932747822689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200608204250.3291-11-jmaneyrol@invensense.com>
References: <20200608204250.3291-11-jmaneyrol@invensense.com>
TO: "Jean-Baptiste Maneyrol" <jmaneyrol@invensense.com>
TO: jic23(a)kernel.org
TO: robh+dt(a)kernel.org
TO: robh(a)kernel.org
TO: mchehab+huawei(a)kernel.org
TO: davem(a)davemloft.net
TO: gregkh(a)linuxfoundation.org
CC: linux-iio(a)vger.kernel.org
CC: devicetree(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: "Jean-Baptiste Maneyrol" <jmaneyrol@invensense.com>

Hi Jean-Baptiste,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on iio/togreg]
[also build test WARNING on robh/for-next v5.7]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Jean-Baptiste-Maneyrol/iio=
-imu-new-inv_icm42600-driver/20200609-044917
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:70:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *accel =3D &pack2->accel;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:71:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *gyro =3D &pack2->gyro;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:72:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *temp =3D &pack2->temp;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:79:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *accel =3D &pack1->data;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:81:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *temp =3D &pack1->temp;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:89:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *gyro =3D &pack1->data;
     ^
   drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c:90:3: warning: Addres=
s of local auto-variable assigned to a function parameter. [autoVariables]
     *temp =3D &pack1->temp;
     ^

# https://github.com/0day-ci/linux/commit/aaea93463d06a3965ecc840c4d132a604=
78aa694
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout aaea93463d06a3965ecc840c4d132a60478aa694
vim +70 drivers/iio/imu/inv_icm42600/inv_icm42600_buffer.c

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  41  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  42  ssize_t inv_icm42600_=
fifo_decode_packet(const void *packet, const void **accel,
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  43  					const void **gyr=
o, const int8_t **temp,
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  44  					const void **tim=
estamp, unsigned int *odr)
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  45  {
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  46  	const struct inv_icm=
42600_fifo_1sensor_packet *pack1 =3D packet;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  47  	const struct inv_icm=
42600_fifo_2sensors_packet *pack2 =3D packet;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  48  	uint8_t header =3D *=
((const uint8_t *)packet);
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  49  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  50  	/* FIFO empty */
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  51  	if (header & INV_ICM=
42600_FIFO_HEADER_MSG) {
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  52  		*accel =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  53  		*gyro =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  54  		*temp =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  55  		*timestamp =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  56  		*odr =3D 0;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  57  		return 0;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  58  	}
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  59  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  60  	/* handle odr flags =
*/
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  61  	*odr =3D 0;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  62  	if (header & INV_ICM=
42600_FIFO_HEADER_ODR_GYRO)
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  63  		*odr |=3D INV_ICM42=
600_SENSOR_GYRO;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  64  	if (header & INV_ICM=
42600_FIFO_HEADER_ODR_ACCEL)
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  65  		*odr |=3D INV_ICM42=
600_SENSOR_ACCEL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  66  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  67  	/* accel + gyro */
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  68  	if ((header & INV_IC=
M42600_FIFO_HEADER_ACCEL) &&
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  69  	    (header & INV_IC=
M42600_FIFO_HEADER_GYRO)) {
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08 @70  		*accel =3D &pack2->=
accel;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  71  		*gyro =3D &pack2->g=
yro;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  72  		*temp =3D &pack2->t=
emp;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  73  		*timestamp =3D &pac=
k2->timestamp;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  74  		return INV_ICM42600=
_FIFO_2SENSORS_PACKET_SIZE;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  75  	}
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  76  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  77  	/* accel only */
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  78  	if (header & INV_ICM=
42600_FIFO_HEADER_ACCEL) {
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  79  		*accel =3D &pack1->=
data;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  80  		*gyro =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  81  		*temp =3D &pack1->t=
emp;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  82  		*timestamp =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  83  		return INV_ICM42600=
_FIFO_1SENSOR_PACKET_SIZE;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  84  	}
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  85  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  86  	/* gyro only */
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  87  	if (header & INV_ICM=
42600_FIFO_HEADER_GYRO) {
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  88  		*accel =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  89  		*gyro =3D &pack1->d=
ata;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  90  		*temp =3D &pack1->t=
emp;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  91  		*timestamp =3D NULL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  92  		return INV_ICM42600=
_FIFO_1SENSOR_PACKET_SIZE;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  93  	}
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  94  =

aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  95  	/* invalid packet if=
 here */
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  96  	return -EINVAL;
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  97  }
aaea93463d06a3 Jean-Baptiste Maneyrol 2020-06-08  98  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2311956932747822689==--

