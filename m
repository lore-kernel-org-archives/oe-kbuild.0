Content-Type: multipart/mixed; boundary="===============7678677088327044197=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [ath6kl:pending 10/12] drivers/net/wireless/ath/ath10k/mac.c:3010 ath10k_mac_set_sar_specs() warn: this array is probably non-NULL. 'sar->sub_specs'
Date: Wed, 27 Jan 2021 13:58:45 +0300
Message-ID: <20210127105845.GR20820@kadam>
In-Reply-To: <871re6abza.fsf@codeaurora.org>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7678677088327044197==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 12:52:09PM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> =

> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git  =
pending
> > head:   13112a10a90ece17774a25bc363a7561c26aa19f
> > commit: c995c0bdf2d68ce279507a2017e1e65e823339df [10/12] ath10k: allow
> > dynamic SAR power limits via common API
> > config: x86_64-randconfig-m001-20210121 (attached as .config)
> > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > New smatch warnings:
> > drivers/net/wireless/ath/ath10k/mac.c:3010 ath10k_mac_set_sar_specs()
> > warn: this array is probably non-NULL. 'sar->sub_specs'
> >
> > Old smatch warnings:
> > drivers/net/wireless/ath/ath10k/mac.c:5150 ath10k_start() warn:
> > missing error code 'ret'
> > drivers/net/wireless/ath/ath10k/mac.c:5589 ath10k_add_interface()
> > warn: missing error code 'ret'
> >
> > vim +3010 drivers/net/wireless/ath/ath10k/mac.c
> >
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2993  =

> > c995c0bdf2d68ce Carl Huang 2021-01-18 2994 static int
> > ath10k_mac_set_sar_specs(struct ieee80211_hw *hw,
> > c995c0bdf2d68ce Carl Huang 2021-01-18 2995 const struct
> > cfg80211_sar_specs *sar)
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2996  {
> > c995c0bdf2d68ce Carl Huang 2021-01-18 2997 const struct
> > cfg80211_sar_sub_specs *sub_specs;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2998  	struct ath10k *ar =3D hw-=
>priv;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  2999  	u32 i;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3000  	int ret;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3001  =

> > c995c0bdf2d68ce Carl Huang 2021-01-18  3002  	mutex_lock(&ar->conf_mute=
x);
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3003  =

> > c995c0bdf2d68ce Carl Huang 2021-01-18 3004 if
> > (!ar->hw_params.dynamic_sar_support) {
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3005  		ret =3D -EOPNOTSUPP;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3006  		goto error;
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3007  	}
> > c995c0bdf2d68ce Carl Huang 2021-01-18  3008  =

> > c995c0bdf2d68ce Carl Huang 2021-01-18 3009 if (!sar || sar->type !=3D
> > NL80211_SAR_TYPE_POWER ||
> > c995c0bdf2d68ce Carl Huang 2021-01-18 @3010 sar->num_sub_specs =3D=3D 0=
 ||
> > !sar->sub_specs) {
> >                                                                        =
        ^^^^^^^^^^^^^^^
> > You could delete this if you want.  It can't be NULL.
> =

> I removed !sar->sub_specs (I hope that's what you meant) in the in the
> pending branch, thanks.

Yeah.  No need to check.  It's the address of an array and the array is
not the first struct member.  And even ->sub_specs was the first
struct member then we know "sar" is non-NULL so there is no way
sar->sub_specs can be NULL.

regards,
dan carpenter

--===============7678677088327044197==--

