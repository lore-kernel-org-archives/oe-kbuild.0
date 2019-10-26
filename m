Content-Type: multipart/mixed; boundary="===============3280746508391068493=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [plbossart-sound:integration/soundwire-20191022 51/53] drivers/soundwire/stream.c:1557 sdw_prepare_stream() warn: variable dereferenced before check 'stream' (see line 1555)
Date: Sat, 26 Oct 2019 07:45:33 +0300
Message-ID: <20191026044533.GI23523@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3280746508391068493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/plbossart/sound integration/soundwire-20191022
head:   40ac17aeeb4954510b3db3a8314fa5ab3a0169f6
commit: 8b1325343c5c750a0b25120bf354c7a73cfda4c6 [51/53] [HACK] add traces =
to debug aplay suspend/resume issue

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/soundwire/stream.c:1557 sdw_prepare_stream() warn: variable derefer=
enced before check 'stream' (see line 1555)
drivers/soundwire/stream.c:1655 sdw_enable_stream() warn: variable derefere=
nced before check 'stream' (see line 1653)
drivers/soundwire/stream.c:1744 sdw_disable_stream() warn: variable derefer=
enced before check 'stream' (see line 1742)
drivers/soundwire/stream.c:1816 sdw_deprepare_stream() warn: variable deref=
erenced before check 'stream' (see line 1814)

Old smatch warnings:
drivers/soundwire/stream.c:102 _sdw_program_slave_port_params() warn: '(t_p=
arams->sample_interval - 1)' 4294967295 can't fit into 65535 'wbuf'
include/linux/compiler.h:226 __write_once_size() warn: potential memory cor=
rupting cast 8 vs 4 bytes

# https://github.com/plbossart/sound/commit/8b1325343c5c750a0b25120bf354c7a=
73cfda4c6
git remote add plbossart-sound https://github.com/plbossart/sound
git remote update plbossart-sound
git checkout 8b1325343c5c750a0b25120bf354c7a73cfda4c6
vim +/stream +1557 drivers/soundwire/stream.c

5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1550  int sdw_prepare_stre=
am(struct sdw_stream_runtime *stream)
5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1551  {
564e8992e95ea1 Pierre-Louis Bossart  2019-10-15  1552  	bool update_params =
=3D true;
36269dcfbd2d7f Bard Liao             2019-09-20  1553  	int ret;
5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1554  =

8b1325343c5c75 Pierre-Louis Bossart  2019-10-12 @1555  	pr_err("%s: %s star=
t\n", __func__, stream->name);
                                                                           =
                ^^^^^^^^^^^^
Unchecked dereference.

8b1325343c5c75 Pierre-Louis Bossart  2019-10-12  1556  =

5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26 @1557  	if (!stream) {
                                                            ^^^^^^^
Too late.

17ed5bef49f42e Pierre-Louis Bossart  2019-05-01  1558  		pr_err("SoundWire:=
 Handle not found for stream\n");
5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1559  		return -EINVAL;
5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1560  	}
5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1561  =

48949722ced4da Vinod Koul            2018-07-27  1562  	sdw_acquire_bus_loc=
k(stream);
5c3eb9f7bdf1f1 Sanyog Kale           2018-04-26  1563  =

36269dcfbd2d7f Bard Liao             2019-09-20  1564  	if (stream->state =
=3D=3D SDW_STREAM_PREPARED) {
36269dcfbd2d7f Bard Liao             2019-09-20  1565  		ret =3D 0;

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on
--===============3280746508391068493==--

