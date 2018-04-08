import { NgModule} from '@angular/core';
import {Routes, RouterModule } from '@angular/router';
import { HomePageComponent } from './home-page/home-page.component';

const routes: Routes = [
    {path: '', redirectTo: 'home', pathMatch: 'full'},
    {path: 'home', component: HomePageComponent}, //Javascript object ,hash map, key hst o e a string
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule{} //Moule to modify anoither one