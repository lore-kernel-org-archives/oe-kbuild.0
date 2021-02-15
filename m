Content-Type: multipart/mixed; boundary="===============7357525805688043175=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH net-next 09/12] net: dsa: tag_ocelot: create separate tagger for Seville
Date: Mon, 15 Feb 2021 17:15:21 +0300
Message-ID: <20210215141521.GC2222@kadam>
In-Reply-To: <20210215131931.4nibzc53doqiignb@skbuf>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7357525805688043175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 15, 2021 at 03:19:31PM +0200, Vladimir Oltean wrote:
> Hi Dan,
> =

> On Mon, Feb 15, 2021 at 04:00:04PM +0300, Dan Carpenter wrote:
> > db->index is less than db->num_ports which 32 or less but sometimes it
> > comes from the device tree so who knows.
> =

> The destination port mask is copied into a 12-bit field of the packet,
> starting at bit offset 67 and ending at 56:
> =

> static inline void ocelot_ifh_set_dest(void *injection, u64 dest)
> {
> 	packing(injection, &dest, 67, 56, OCELOT_TAG_LEN, PACK, 0);
> }
> =

> So this DSA tagging protocol supports at most 12 bits, which is clearly
> less than 32. Attempting to send to a port number > 12 will cause the
> packing() call to truncate way before there will be 32-bit truncation
> due to type promotion of the BIT(port) argument towards u64.
> =

> > The ocelot_ifh_set_dest() function takes a u64 though and that
> > suggests that BIT() should be changed to BIT_ULL().
> =

> I understand that you want to silence the warning, which fundamentally
> comes from the packing() API which works with u64 values and nothing of
> a smaller size. So I can send a patch which replaces BIT(port) with
> BIT_ULL(port), even if in practice both are equally fine.

I don't have a strong feeling about this...  Generally silencing
warnings just to make a checker happy is the wrong idea.

To be honest, I normally ignore these warnings.  But I have been looking
at them recently to try figure out if we could make it so it would only
generate a warning where "db->index" was known as possibly being in the
32-63 range.  So I looked at this one.

And now I see some ways that Smatch could have parsed this better...

regards,
dan carpenter

--===============7357525805688043175==--

