<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer class="footer">
    <div class="footer-wrp clear-fix">
        <div class="footer-family">

            <div class="familysite">
                <p>FAMILY SITES&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>▲</span></p>
            </div>
            <div class="family-list none">
                <div>dfddddddd</div>
                <div>dfddddddddf</div>
                <div>dfddddddf</div>
                <div>dffdddddd</div>
            </div>

        </div>
        <div class="footer-copyright">
            <span>COPYRIGHT ⓒ 2022 BIG HIT MUSIC / HYBE. ALL RIGHTS RESERVED</span>
        </div>
    </div>
</footer>

<script>
    const $siteupEvent = document.querySelector('.familysite').onclick = e =>{
        document.querySelector('.family-list').classList.toggle("none");
    }

</script>