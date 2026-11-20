

egit="egit"
gfs="fs"
gbin="gbin"
gtmp="tmp"
grecover="recover"
pwd
echo "gbin=$gbin"
echo "gfs=$gfs"
echo "egit=$egit"
echo "grecover=$grecover"

function enc-raw()
{
	
	pwd
	echo "$1 $2"
	
	fname="$1"
	fpath="$2"
	
	mkdir -p "../$gtmp/b"
	tar -cf "../$gtmp/b/$fname.tar.xz" "$fpath"
	acrypter encrypt cry15360 "../$gtmp/b/$fname.tar.xz" "../$gtmp/b/$fname.tar.xz.acrypt"
	mkdir -p acrypt/raw
	rm -rvf "acrypt/raw/$fname.tar.xz.acrypt"
	mv "../$gtmp/b/$fname.tar.xz.acrypt" "acrypt/raw/$fname.tar.xz.acrypt"
	rm "../$gtmp/b/$fname.tar.xz"
	#rm fs.tar.xz

}
function enc-parts()
{
	
	pwd
	echo "$1 $2"
	
	fname="$1"
	fpath="$2"
	
	mkdir -p "../$gtmp/c"
	mkdir -p "../$gtmp/d/$fname.tar.xz.acrypt.parts"
	tar -cf "../$gtmp/c/$fname.tar.xz" "$fpath"
	acrypter encrypt cry15360 "../$gtmp/c/$fname.tar.xz" "../$gtmp/c/$fname.tar.xz.acrypt"
	rm "../$gtmp/c/$fname.tar.xz"
	echo "----------------"
	ls "../$gtmp/c/"
	acrypt split "../$gtmp/c/$fname.tar.xz.acrypt" 64 "../$gtmp/d/$fname.tar.xz.acrypt.parts/$fname.tar.xz.acrypt.parts" "$fname.tar.xz.acrypt"
	rm "../$gtmp/c/$fname.tar.xz.acrypt"
	mkdir -p acrypt/parts
	mv "../$gtmp/d/$fname.tar.xz.acrypt.parts" "acrypt/parts/."
	#rm -rvf "acrypt-parts/$fname.tar.xz.acrypt"
	#mv "../$gtmp/b/$fname.tar.xz.acrypt" "acrypt-raw/$fname.tar.xz.acrypt"
	
	#rm fs.tar.xz

}


