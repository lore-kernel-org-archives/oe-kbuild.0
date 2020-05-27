Content-Type: multipart/mixed; boundary="===============5420638630818925474=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: net/dsa/tag_8021q.c:109 dsa_8021q_restore_pvid() error: uninitialized symbol 'pvid'.
Date: Wed, 27 May 2020 20:41:34 +0300
Message-ID: <20200527174134.GM22511@kadam>
In-Reply-To: <CA+h21hqw8Ed_k_E8KK7mzDTag7p8jTYFLLkJ_i6+8__BKCdEUQ@mail.gmail.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5420638630818925474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 07:43:29PM +0300, Vladimir Oltean wrote:
> For net-next I just sent a patch that removes this function altogether:
> https://patchwork.ozlabs.org/project/netdev/patch/20200527164134.1081548-=
1-olteanv(a)gmail.com/
> Do you think a patch for the net tree is still necessary, that
> reorders the checks? Will you send that patch or should I?

Since you've already removed the function then that's fine.  Thanks!

regards,
dan carpenter

--===============5420638630818925474==--

