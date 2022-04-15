Content-Type: multipart/mixed; boundary="===============6996856047356589233=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [krzk-github:n/qcom-ufs-opp-v2 14/16] drivers/opp/core.c:1215 dev_pm_opp_set_rate() error: uninitialized symbol 'ret'.
Date: Fri, 15 Apr 2022 09:49:41 +0300
Message-ID: <20220415064941.GF12805@kadam>
In-Reply-To: <202204150900.qnJMf3Gu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6996856047356589233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 15, 2022 at 09:45:47AM +0300, Dan Carpenter wrote:
> tree:   https://github.com/krzk/linux n/qcom-ufs-opp-v2
> head:   bf7d30c9329c87f06dff42b303a9bcfd2e1f54eb
> commit: be46c855d54f763bfb95424e5204fe7496e2ee5f [14/16] PM: opp: allow c=
ontrol of multiple clocks
> config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/202=
20415/202204150900.qnJMf3Gu-lkp(a)intel.com/config)
> compiler: gcc-11 (Debian 11.2.0-19) 11.2.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> New smatch warnings:
> drivers/opp/core.c:1215 dev_pm_opp_set_rate() error: uninitialized symbol=
 'ret'.
> =


This one is the warning I meant to include.

> Old smatch warnings:
> drivers/opp/core.c:1197 dev_pm_opp_set_rate() warn: passing a valid point=
er to 'PTR_ERR'
> drivers/opp/core.c:2813 _opp_set_availability() warn: passing a valid poi=
nter to 'PTR_ERR'
> drivers/opp/core.c:2884 dev_pm_opp_adjust_voltage() warn: passing a valid=
 pointer to 'PTR_ERR'

Sorry, these are false positives.  It comes from Smatch thinking
pointers are signed on certain arches.  I've been too lazy to set up a
cross compile system to debug the issue, but I really need to do that.  :/

regards,
dan carpenter

--===============6996856047356589233==--

