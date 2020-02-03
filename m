Content-Type: multipart/mixed; boundary="===============5117634294986587896=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [hwmon:hwmon-playground 6/16] drivers/hwmon/pmbus/pmbus_core.c:174 pmbus_set_page() warn: this array is probably non-NULL. 'data->info->phases'
Date: Mon, 03 Feb 2020 11:45:22 +0300
Message-ID: <20200203084521.GI11068@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5117634294986587896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stagin=
g.git hwmon-playground
head:   b6b911a2f7d675c768f19e75ba2e8ed216fce65a
commit: 17e064db5aa2cfbfd254c0951544f88b2b1258ee [6/16] hwmon: (pmbus) Impl=
ement multi-phase support

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/pmbus/pmbus_core.c:174 pmbus_set_page() warn: this array is n=
on-NULL. 'data->info->phases'

# https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/=
commit/?id=3D17e064db5aa2cfbfd254c0951544f88b2b1258ee
git remote add hwmon https://git.kernel.org/pub/scm/linux/kernel/git/groeck=
/linux-staging.git
git remote update hwmon
git checkout 17e064db5aa2cfbfd254c0951544f88b2b1258ee
vim +174 drivers/hwmon/pmbus/pmbus_core.c

ce603b18f30aea drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2013-01-26  =
150  =

6db8d5dba444f2 drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-14  =
151  int pmbus_set_page(struct i2c_client *client, int page, int phase)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
152  {
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
153  	struct pmbus_data *data =3D i2c_get_clientdata(client);
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
154  	int rv;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
155  =

17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
156  	if (page < 0)
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
157  		return 0;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
158  =

17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
159  	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
160  	    data->info->pages > 1 && page !=3D data->currpage) {
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
161  		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
162  		if (rv < 0)
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
163  			return rv;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
164  =

464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
165  		rv =3D i2c_smbus_read_byte_data(client, PMBUS_PAGE);
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
166  		if (rv < 0)
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
167  			return rv;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
168  =

464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
169  		if (rv !=3D page)
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
170  			return -EIO;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
171  	}
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
172  	data->currpage =3D page;
464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
173  =

17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13 @=
174  	if (data->info->phases && data->currphase !=3D phase &&
                                                                           =
                 ^^^^^^^^^^^^^^^^^^
Delete this condition?

17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
175  	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
176  		rv =3D i2c_smbus_write_byte_data(client, PMBUS_PHASE,
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
177  					       phase);
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
178  		if (rv)
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
179  			return rv;
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
180  	}
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
181  	data->currphase =3D phase;
17e064db5aa2cf drivers/hwmon/pmbus/pmbus_core.c Guenter Roeck  2020-01-13  =
182  =

464df6fa376678 drivers/hwmon/pmbus/pmbus_core.c Andrew Jeffery 2017-11-20  =
183  	return 0;
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
184  }
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
185  EXPORT_SYMBOL_GPL(pmbus_set_page);
442aba78728e77 drivers/hwmon/pmbus_core.c       Guenter Roeck  2011-01-26  =
186  =


---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============5117634294986587896==--

