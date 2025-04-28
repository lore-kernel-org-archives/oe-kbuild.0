Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529918BBBB;
	Mon, 28 Apr 2025 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745878217; cv=none; b=MJLOdjJQroGYNmd7eqdMGwabqyYisWOyb6upUi8TmepYVYMwvYOOlrmeRDRnEhKRQmzA5yTtXQteyQ/rBQDdltTXVFyb1fFz1Gu8RdcTlKPVYs9VngMwehIyAlDJnmcJcSb5710o5OF1SBpxXOxrYibFYThznTLueAVq3rJr1CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745878217; c=relaxed/simple;
	bh=uIzPWoRnQgetoFt6qUJlH+8oIS0aGCriUQItkH/OtvU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZR5SYjh36RynrnFlfxtJwMsidCfcLDG4Y4P8WqJReRXv6gJIhOSSj3nJTgTX4gez57EE2yngRdnoYb3r3DQCgIx2gXaVgSyImkGpiL9cVnh0dacBdkTfUYAPQS/dA2tseZdDD/m2a55+Bz7VM9mYUBDFtrPbyYjwtotjJAdc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlK12vwz; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlK12vwz"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so63356586d6.1;
        Mon, 28 Apr 2025 15:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745878214; x=1746483014; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G68A8gbIzA2mqZ+V7TIqI4HzTFE3WV0mnGFlPr8YtK8=;
        b=dlK12vwzjq8Dy5O0cWh6BK3MR+QDb+OX08J/wPdcd6qBH/zDHRrksqjnxurZMWHdNC
         mr5Yd796PolUvI181rj9PrQ05kLkjmH98OxmXu4zpttYtvRDMtY3V5JyckAqkCspVFk0
         nBNZbqm9yX51rAIOpcx+xE36ck5lO1y1nt1NmbG1HGy87Z1bB9BCwAOi7KtsCyNp+C+/
         Zazvg3knEpBQfxugB3lSM68PFVqVvUb2UPcVeHHojEjSAiKau1B/PZZSU7G3VC+aMZSp
         ZoyB0QjhOfv8He+Il5JKnVo6ZAmPoX7y2Gez1GEw1ZO8Rsi3zFROS1pBirlrflejoN7v
         zWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745878214; x=1746483014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G68A8gbIzA2mqZ+V7TIqI4HzTFE3WV0mnGFlPr8YtK8=;
        b=Rp2WEZBrgjivRTsu3NGDHHL8bJdYdXDlA47IL1+84adYiWsR7syK94YnaNvuzIofmP
         nOCr/HysjHwcY9l3F+RJSdHWruFRIg0pV9MDk6on4acqVNdjipNIZzyrJq8hzez7MSRQ
         gUMf9cBmEvgpTpoMnNVqSkP9Z3Jm5gM2VHNfiwSCMtIC/TRK8Cj5eQYMdDuGT5uZPp1S
         w6w67U0V7xQRiP2yoOyxH7sWDcpjJnVioNyUGBJyp2cxQyfxqoLnbzm9ytN2VO2evLw5
         K2+pDX5H06ofiN8P6rRtljOnN7+vYUPqYlZOb/C+PGU+Uj8Id5xwu4OTMQEIO5OzlaM+
         fUtA==
X-Forwarded-Encrypted: i=1; AJvYcCU79Gv0QI00bKGQ/l/Ym3WP3Hl0JocYpqyTxxZEYzJXOfq7InmU96vuAGGuJQ7HS6ntgBm3DQxEer+Yy/dC@lists.linux.dev
X-Gm-Message-State: AOJu0YxWozent30PAbq7/unr8Hg3dRhvkiJa191+lJZDJk96DbJfSl6H
	QswrZd1CUm1osIbpb+2bYLagiJjf7FvmuufKjeFxdVxsZnLDdSLlF1EL7BBqDFyboj9IG5qgqvW
	KVLUXjP6C9dI8j5GEqmbvNF6nyk0=
X-Gm-Gg: ASbGnctAUe9R/wdpG/6S56z5gxtSHYZjY5MT/vDqwAr+YJ6VBZii42h2WdLQ/iFVoy9
	l3ij2OVKLvsrqS/WjyNDK+/vnihKucEkFXW3ezEeC7chEfGZfTB6YKIOm8sya3MB2CBs8dKGMsn
	jdrm1vfToTzHSbfch1U2BlnsEH3LW5E31cEfhJFA==
X-Google-Smtp-Source: AGHT+IE22CIMJ3/Dy12So6gWQ5dHnjecZh2lK3MyEjrATJvZ3z0iQuEMuG3GgsKEHb+cPpONIvs2MczKNZE3GaOWFGE=
X-Received: by 2002:a05:6214:d65:b0:6e8:c713:31fa with SMTP id
 6a1803df08f44-6f4f1b9b9eamr13701926d6.9.1745878213615; Mon, 28 Apr 2025
 15:10:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250426000828.3216220-4-joannelkoong@gmail.com> <202504270319.GmkEM1Xg-lkp@intel.com>
In-Reply-To: <202504270319.GmkEM1Xg-lkp@intel.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 28 Apr 2025 15:10:02 -0700
X-Gm-Features: ATxdqUEue-pjLCwu47H75XWwWB18kNTPsRbl5NdPPz05R0lLZOHA2myeYKL-MTk
Message-ID: <CAJnrk1YT+Q1_Fw4zNm-nutNrM1rA44brtGJKNr2u_zt2XFQwkQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/11] fuse: refactor fuse_fill_write_pages()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, miklos@szeredi.hu, lkp@intel.com, 
	oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	jlayton@kernel.org, jefflexu@linux.alibaba.com, josef@toxicpanda.com, 
	bernd.schubert@fastmail.fm, willy@infradead.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 27, 2025 at 10:32=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi Joanne,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/fuse-=
support-copying-large-folios/20250426-081219
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git=
 for-next
> patch link:    https://lore.kernel.org/r/20250426000828.3216220-4-joannel=
koong%40gmail.com
> patch subject: [PATCH v5 03/11] fuse: refactor fuse_fill_write_pages()
> config: i386-randconfig-141-20250426 (https://download.01.org/0day-ci/arc=
hive/20250427/202504270319.GmkEM1Xg-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202504270319.GmkEM1Xg-lkp@intel.com/
>
> smatch warnings:
> fs/fuse/file.c:1207 fuse_fill_write_pages() error: uninitialized symbol '=
err'.
>
> vim +/err +1207 fs/fuse/file.c
>
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1127  static ssize_t fuse_f=
ill_write_pages(struct fuse_io_args *ia,
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1128                       =
            struct address_space *mapping,
> 338f2e3f3341a9 Miklos Szeredi     2019-09-10  1129                       =
            struct iov_iter *ii, loff_t pos,
> 338f2e3f3341a9 Miklos Szeredi     2019-09-10  1130                       =
            unsigned int max_pages)
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1131  {
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1132      struct fuse_args_=
pages *ap =3D &ia->ap;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1133      struct fuse_conn =
*fc =3D get_fuse_conn(mapping->host);
> 09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1134      unsigned offset =
=3D pos & (PAGE_SIZE - 1);
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1135      size_t count =3D =
0;
> dfda790dfda452 Joanne Koong       2025-04-25  1136      unsigned int num;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1137      int err;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1138
> dfda790dfda452 Joanne Koong       2025-04-25  1139      num =3D min(iov_i=
ter_count(ii), fc->max_write);
>
> Can iov_iter_count() return zero here?
>
> dfda790dfda452 Joanne Koong       2025-04-25  1140      num =3D min(num, =
max_pages << PAGE_SHIFT);
> dfda790dfda452 Joanne Koong       2025-04-25  1141
> 338f2e3f3341a9 Miklos Szeredi     2019-09-10  1142      ap->args.in_pages=
 =3D true;
> 68bfb7eb7f7de3 Joanne Koong       2024-10-24  1143      ap->descs[0].offs=
et =3D offset;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1144
> dfda790dfda452 Joanne Koong       2025-04-25  1145      while (num) {
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1146              size_t tm=
p;
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1147              struct fo=
lio *folio;
> 09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1148              pgoff_t i=
ndex =3D pos >> PAGE_SHIFT;
> dfda790dfda452 Joanne Koong       2025-04-25  1149              unsigned =
bytes =3D min(PAGE_SIZE - offset, num);
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1150
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1151   again:
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1152              folio =3D=
 __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1153                       =
                   mapping_gfp_mask(mapping));
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1154              if (IS_ER=
R(folio)) {
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1155                      e=
rr =3D PTR_ERR(folio);
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1156                      b=
reak;
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1157              }
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1158
> 931e80e4b3263d anfei zhou         2010-02-02  1159              if (mappi=
ng_writably_mapped(mapping))
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1160                      f=
lush_dcache_folio(folio);
> 931e80e4b3263d anfei zhou         2010-02-02  1161
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1162              tmp =3D c=
opy_folio_from_iter_atomic(folio, offset, bytes, ii);
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1163              flush_dca=
che_folio(folio);
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1164
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1165              if (!tmp)=
 {
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1166                      f=
olio_unlock(folio);
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1167                      f=
olio_put(folio);
> faa794dd2e17e7 Dave Hansen        2025-01-29  1168
> faa794dd2e17e7 Dave Hansen        2025-01-29  1169                      /=
*
> faa794dd2e17e7 Dave Hansen        2025-01-29  1170                       =
* Ensure forward progress by faulting in
> faa794dd2e17e7 Dave Hansen        2025-01-29  1171                       =
* while not holding the folio lock:
> faa794dd2e17e7 Dave Hansen        2025-01-29  1172                       =
*/
> faa794dd2e17e7 Dave Hansen        2025-01-29  1173                      i=
f (fault_in_iov_iter_readable(ii, bytes)) {
> faa794dd2e17e7 Dave Hansen        2025-01-29  1174                       =
       err =3D -EFAULT;
> faa794dd2e17e7 Dave Hansen        2025-01-29  1175                       =
       break;
> faa794dd2e17e7 Dave Hansen        2025-01-29  1176                      }
> faa794dd2e17e7 Dave Hansen        2025-01-29  1177
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1178                      g=
oto again;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1179              }
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1180
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1181              err =3D 0=
;
> f2ef459bab7326 Joanne Koong       2024-10-24  1182              ap->folio=
s[ap->num_folios] =3D folio;
> 68bfb7eb7f7de3 Joanne Koong       2024-10-24  1183              ap->descs=
[ap->num_folios].length =3D tmp;
> f2ef459bab7326 Joanne Koong       2024-10-24  1184              ap->num_f=
olios++;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1185
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1186              count +=
=3D tmp;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1187              pos +=3D =
tmp;
> dfda790dfda452 Joanne Koong       2025-04-25  1188              num -=3D =
tmp;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1189              offset +=
=3D tmp;
> 09cbfeaf1a5a67 Kirill A. Shutemov 2016-04-01  1190              if (offse=
t =3D=3D PAGE_SIZE)
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1191                      o=
ffset =3D 0;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1192
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1193              /* If we =
copied full page, mark it uptodate */
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1194              if (tmp =
=3D=3D PAGE_SIZE)
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1195                      f=
olio_mark_uptodate(folio);
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1196
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1197              if (folio=
_test_uptodate(folio)) {
> 9bafbe7ae01321 Josef Bacik        2024-09-30  1198                      f=
olio_unlock(folio);
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1199              } else {
> f2ef459bab7326 Joanne Koong       2024-10-24  1200                      i=
a->write.folio_locked =3D true;
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1201                      b=
reak;
> 4f06dd92b5d0a6 Vivek Goyal        2020-10-21  1202              }
> dfda790dfda452 Joanne Koong       2025-04-25  1203              if (!fc->=
big_writes || offset !=3D 0)
> 78bb6cb9a890d3 Miklos Szeredi     2008-05-12  1204                      b=
reak;
> dfda790dfda452 Joanne Koong       2025-04-25  1205      }
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1206
> ea9b9907b82a09 Nicholas Piggin    2008-04-30 @1207      return count > 0 =
? count : err;
> ea9b9907b82a09 Nicholas Piggin    2008-04-30  1208  }
>

I'll initialize err to 0 in v6. I'll wait for more reviews/comments on
the patchset before sending that out.

Thanks,
Joanne

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
