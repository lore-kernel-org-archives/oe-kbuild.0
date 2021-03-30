Content-Type: multipart/mixed; boundary="===============7808848535777451501=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1290/8469] arch/um/kernel/kmsg_dump.c:10:13: sparse: sparse: context imbalance in 'kmsg_dumper_stdout' - different lock contexts for basic block
Date: Tue, 30 Mar 2021 10:03:01 +0800
Message-ID: <202103301056.Q7JQ6WcX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7808848535777451501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: John Ogness <john.ogness@linutronix.de>
CC: Petr Mladek <pmladek@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9d49ed9ca93b8c564033c1d6808017bc9052b5db
commit: fdd2c1f4e2c2e2fee1d95d18b4b06bc0d15c368a [1290/8469] um: synchroniz=
e kmsg_dumper
:::::: branch date: 16 hours ago
:::::: commit date: 3 weeks ago
config: um-randconfig-s032-20210329 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-277-gc089cd2d-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dfdd2c1f4e2c2e2fee1d95d18b4b06bc0d15c368a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fdd2c1f4e2c2e2fee1d95d18b4b06bc0d15c368a
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Dum =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/um/kernel/kmsg_dump.c:51:12: sparse: sparse: symbol 'kmsg_dumper_st=
dout_init' was not declared. Should it be static?
>> arch/um/kernel/kmsg_dump.c:10:13: sparse: sparse: context imbalance in '=
kmsg_dumper_stdout' - different lock contexts for basic block

vim +/kmsg_dumper_stdout +10 arch/um/kernel/kmsg_dump.c

04a418495e0852 Thomas Meyer    2015-03-28   9  =

04a418495e0852 Thomas Meyer    2015-03-28 @10  static void kmsg_dumper_stdo=
ut(struct kmsg_dumper *dumper,
04a418495e0852 Thomas Meyer    2015-03-28  11  				enum kmsg_dump_reason re=
ason)
04a418495e0852 Thomas Meyer    2015-03-28  12  {
fdd2c1f4e2c2e2 John Ogness     2021-03-03  13  	static DEFINE_SPINLOCK(lock=
);
04a418495e0852 Thomas Meyer    2015-03-28  14  	static char line[1024];
7d7c0568285d6f Andy Shevchenko 2020-02-12  15  	struct console *con;
fdd2c1f4e2c2e2 John Ogness     2021-03-03  16  	unsigned long flags;
04a418495e0852 Thomas Meyer    2015-03-28  17  	size_t len =3D 0;
04a418495e0852 Thomas Meyer    2015-03-28  18  =

04a418495e0852 Thomas Meyer    2015-03-28  19  	/* only dump kmsg when no c=
onsole is available */
04a418495e0852 Thomas Meyer    2015-03-28  20  	if (!console_trylock())
04a418495e0852 Thomas Meyer    2015-03-28  21  		return;
04a418495e0852 Thomas Meyer    2015-03-28  22  =

e23fe90dec286c Thomas Meyer    2021-01-07  23  	for_each_console(con) {
e23fe90dec286c Thomas Meyer    2021-01-07  24  		if(strcmp(con->name, "tty"=
) =3D=3D 0 &&
e23fe90dec286c Thomas Meyer    2021-01-07  25  		   (con->flags & (CON_ENAB=
LED | CON_CONSDEV)) !=3D 0) {
7d7c0568285d6f Andy Shevchenko 2020-02-12  26  			break;
e23fe90dec286c Thomas Meyer    2021-01-07  27  		}
e23fe90dec286c Thomas Meyer    2021-01-07  28  	}
04a418495e0852 Thomas Meyer    2015-03-28  29  =

04a418495e0852 Thomas Meyer    2015-03-28  30  	console_unlock();
04a418495e0852 Thomas Meyer    2015-03-28  31  =

7d7c0568285d6f Andy Shevchenko 2020-02-12  32  	if (con)
04a418495e0852 Thomas Meyer    2015-03-28  33  		return;
04a418495e0852 Thomas Meyer    2015-03-28  34  =

fdd2c1f4e2c2e2 John Ogness     2021-03-03  35  	if (!spin_trylock_irqsave(&=
lock, flags))
fdd2c1f4e2c2e2 John Ogness     2021-03-03  36  		return;
fdd2c1f4e2c2e2 John Ogness     2021-03-03  37  =

04a418495e0852 Thomas Meyer    2015-03-28  38  	printf("kmsg_dump:\n");
04a418495e0852 Thomas Meyer    2015-03-28  39  	while (kmsg_dump_get_line(d=
umper, true, line, sizeof(line), &len)) {
04a418495e0852 Thomas Meyer    2015-03-28  40  		line[len] =3D '\0';
04a418495e0852 Thomas Meyer    2015-03-28  41  		printf("%s", line);
04a418495e0852 Thomas Meyer    2015-03-28  42  	}
fdd2c1f4e2c2e2 John Ogness     2021-03-03  43  =

fdd2c1f4e2c2e2 John Ogness     2021-03-03  44  	spin_unlock_irqrestore(&loc=
k, flags);
04a418495e0852 Thomas Meyer    2015-03-28  45  }
04a418495e0852 Thomas Meyer    2015-03-28  46  =


:::::: The code at line 10 was first introduced by commit
:::::: 04a418495e0852263d77c4fb82adf470feaafef3 um: add a kmsg_dumper

:::::: TO: Thomas Meyer <thomas@m3y3r.de>
:::::: CC: Richard Weinberger <richard@nod.at>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7808848535777451501==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
+T/z45e1UI0AAA==
--===============7808848535777451501==--

