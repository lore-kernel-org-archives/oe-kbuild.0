Content-Type: multipart/mixed; boundary="===============5486790351881407699=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [kvalo-ath:pending 52/56] drivers/net/wireless/ath/ath11k/wmi.c:5651 ath11k_wmi_tlv_fw_stats_data_parse() error: uninitialized symbol 'len'.
Date: Tue, 11 Jan 2022 16:58:05 +0300
Message-ID: <20220111135805.GL1978@kadam>
In-Reply-To: <87czkyv1i9.fsf@kernel.org>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5486790351881407699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 11, 2022 at 03:35:26PM +0200, Kalle Valo wrote:
> > bc5c448b70ff14 Wen Gong 2021-12-08 5629 static int
> > ath11k_wmi_tlv_fw_stats_data_parse(struct ath11k_base *ab,
> > bc5c448b70ff14 Wen Gong 2021-12-08 5630 struct wmi_tlv_fw_stats_parse
> > *parse,
> > bc5c448b70ff14 Wen Gong 2021-12-08 5631 const void *ptr)
> > bc5c448b70ff14 Wen Gong   2021-12-08  5632  {
> > bc5c448b70ff14 Wen Gong 2021-12-08 5633 struct ath11k_fw_stats *stats
> > =3D parse->stats;
> > bc5c448b70ff14 Wen Gong 2021-12-08 5634 const struct wmi_stats_event
> > *ev =3D parse->ev;
> > bc5c448b70ff14 Wen Gong   2021-12-08  5635  	int i;
> > bc5c448b70ff14 Wen Gong   2021-12-08  5636  	const void *data =3D ptr;
> > bc5c448b70ff14 Wen Gong   2021-12-08  5637  	u32 len;
                                                        ^^^^^^^^
"len" is a local variable, not a parameter.

> > bc5c448b70ff14 Wen Gong   2021-12-08  5638  =

> > bc5c448b70ff14 Wen Gong   2021-12-08  5639  	if (!ev) {
> > bc5c448b70ff14 Wen Gong 2021-12-08 5640 ath11k_warn(ab, "failed to
> > fetch update stats ev");
> > bc5c448b70ff14 Wen Gong   2021-12-08  5641  		return -EPROTO;
> > bc5c448b70ff14 Wen Gong   2021-12-08  5642  	}
> > d5c65159f28953 Kalle Valo 2019-11-23  5643  =

> > d5c65159f28953 Kalle Valo 2019-11-23  5644  	stats->stats_id =3D 0;
> > d5c65159f28953 Kalle Valo 2019-11-23  5645  =

> > d5c65159f28953 Kalle Valo 2019-11-23 5646 for (i =3D 0; i <
> > ev->num_pdev_stats; i++) {
> > d5c65159f28953 Kalle Valo 2019-11-23 5647 const struct wmi_pdev_stats
> > *src;
> > d5c65159f28953 Kalle Valo 2019-11-23 5648 struct ath11k_fw_stats_pdev
> > *dst;
> > d5c65159f28953 Kalle Valo 2019-11-23  5649  =

> > d5c65159f28953 Kalle Valo 2019-11-23  5650  		src =3D data;
> > bc5c448b70ff14 Wen Gong   2021-12-08 @5651  		if (len < sizeof(*src))
> >
> > "len" is never initialized.
> =

> I only quickly looked at this, but AFAICS ath11k_wmi_tlv_iter() provides
> len to ath11k_wmi_tlv_fw_stats_parse() which again provides len to
> ath11k_wmi_tlv_fw_stats_data_parse(). I'm not seeing how this is
> uninitalised, did I miss something?

I think the bug was fixed and the tree was rebased?  I only look at the
email and hit forward and the code in the email was clearly buggy but
tree looks okay now as you say.

regards,
dan carpenter

--===============5486790351881407699==--

