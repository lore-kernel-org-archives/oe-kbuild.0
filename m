Content-Type: multipart/mixed; boundary="===============1067001867391175429=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: drivers/firmware/arm_scmi/scmi_pm_domain.c:40 scmi_pd_power() error: uninitialized symbol 'ret_state'.
Date: Wed, 08 Dec 2021 15:34:49 +0300
Message-ID: <20211208123449.GJ1956@kadam>
In-Reply-To: <202112081921.SnWPhJS3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1067001867391175429==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2021 at 07:19:03PM +0800, kernel test robot wrote:
> CC: kbuild-all(a)lists.01.org
> CC: linux-kernel(a)vger.kernel.org
> TO: Arnd Bergmann <arnd@arndb.de>
> CC: Bjorn Andersson <bjorn.andersson@linaro.org>
> CC: Charles Keepax <ckeepax@opensource.cirrus.com>
> CC: Mark Brown <broonie@kernel.org>
> =

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
> commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include driver=
s/firmware/Kconfig unconditionally
> date:   9 weeks ago
> :::::: branch date: 12 hours ago
> :::::: commit date: 9 weeks ago
> config: arc-randconfig-m031-20211208 (https://download.01.org/0day-ci/arc=
hive/20211208/202112081921.SnWPhJS3-lkp(a)intel.com/config)
> compiler: arc-elf-gcc (GCC) 11.2.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> =

> smatch warnings:
> drivers/firmware/arm_scmi/scmi_pm_domain.c:40 scmi_pd_power() error: unin=
itialized symbol 'ret_state'.
> drivers/firmware/arm_scmi/scmi_pm_domain.c:95 scmi_pm_domain_probe() erro=
r: uninitialized symbol 'ph'.

Sorry for all these uninitialized variable false positives.  I had
forgotten to commit something.  Fixed now.

regards,
dasn carpenter

--===============1067001867391175429==--

